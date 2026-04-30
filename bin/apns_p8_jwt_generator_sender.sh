#!/bin/bash

# ===== 必须配置的参数 =====
TEAM_ID="XXXXXXXXXX"              # Apple Developer 账号的 Team ID (10位字符)
KEY_ID="YYYYYYYYYY"               # .p8 文件的 Key ID (10位字符)
P8_FILE_PATH="$HOME/Workspaces/__PATH__/AuthKey_YYYYYYYYYY.p8"   # .p8 私钥文件的本地路径
DEVICE_TOKEN="c25b6368be7edb44419af7f4fc138a4b8f82ff642bb3bcd5a9693e2f934dead3"  # 生产环境的设备 token [iPhone 16 Pro Max]
BUNDLE_ID="com.goodbody.robotaxi"   # 你的 App Bundle ID

# 推送内容 (可根据需要修改)
PAYLOAD='{"aps":{"alert":"Good. This is some fancy message T_T.","badge":10,"sound": "default"}}'

# ===== 生成 JWT =====
# Base64 URL-safe 编码函数
base64_url() {
    openssl base64 -e | tr -d '=' | tr '/+' '_-' | tr -d '\n'
}

# JWT Header
JWT_HEADER=$(echo -n '{"alg":"ES256","kid":"'"$KEY_ID"'"}' | base64_url)

# JWT Payload (iat 为当前 Unix 时间戳)
JWT_PAYLOAD=$(echo -n '{"iss":"'"$TEAM_ID"'","iat":'$(date +%s)'}' | base64_url)

# JWT Signature (使用 .p8 私钥进行 ES256 签名)
JWT_SIGNATURE=$(echo -n "$JWT_HEADER.$JWT_PAYLOAD" | openssl dgst -binary -sha256 -sign "$P8_FILE_PATH" | base64_url)

# 组合成完整的 JWT
JWT="$JWT_HEADER.$JWT_PAYLOAD.$JWT_SIGNATURE"

# ===== 发送推送（生产环境）=====
echo -e '\n'
echo -e 'curl -v --http2 \
-H "apns-topic: $BUNDLE_ID" \
-H "authorization: bearer $JWT" \
-d "$PAYLOAD" \
https://api.push.apple.com/3/device/$DEVICE_TOKEN'
echo -e '\n'

curl -v --http2 \
  -H "apns-topic: $BUNDLE_ID" \
  -H "authorization: bearer $JWT" \
  -d "$PAYLOAD" \
  https://api.push.apple.com/3/device/$DEVICE_TOKEN
