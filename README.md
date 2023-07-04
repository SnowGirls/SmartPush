# SmartPush
#### SmartPush,一款IOS苹果推送测试程序,Mac OS下的apns工具APP
#### SmartPush,iOS Push Notification Debug App 
#### 支持使用p8文件 & cer证书文件进行推送
#### 支持切换线路(api.sandbox / api.development)

##### 基于以下三个项目修改,感谢作者
##### PushMeBaby,https://github.com/stefanhafeneger/PushMeBaby
##### PushWithP8,https://github.com/tianguanghui/PushWithP8
##### SmartPushP8,https://github.com/buzhidaoqishenmemingzi/SmartPushP8

## 界面截图
![image](https://raw.githubusercontent.com/shaojiankui/SmartPush/master/demo.png)


## 使用方法
#### 1.使用方法 从任意位置拖拽cer证书到选择控件上,或者从列表控件中选择推送证书,或置浏览任意位置的推送证书
#### 2.填写对应的device token  (device token 不同环境不同)
#### 3.填写或者选择Payload
#### 4.选择即将推送的环境
#### 5.连接推送服务器
#### 6.发送推送
#### 7.手机收到推送消息
#### 8.如测试环境可切换不同域名来规避`TooManyProviderTokenUpdates`的问题