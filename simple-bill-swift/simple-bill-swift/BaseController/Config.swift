//
//  config.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2018/12/25.
//  Copyright © 2018 何建新. All rights reserved.
//

import Foundation
import UIKit
struct UserDefaultKeys {
    // 账户信息
    struct AccountInfo {
        let uid = "uid"
        let userPhone = "userPhone"
        let userPwd = "userPwd"
        let userNickName = "userNickName"
    }
    // 登录信息
    struct LoginInfo {
        let userToken = "token"
        let userTokenTimeOut = "userTokenTimeOut"
    }
    // 配置信息
    struct SettingInfo {
        
    }
}

