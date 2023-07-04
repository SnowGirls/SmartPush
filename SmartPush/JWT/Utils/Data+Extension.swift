//
//  Data+Extension.swift
//  SmartPush
//
//  Created by GreyWolf on 2021/8/26.
//

import Foundation

extension Data {
    func base64EncodedURLString() -> String {
        return base64EncodedString()
            .replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
    }
}
