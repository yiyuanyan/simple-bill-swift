//
//  LoginModel.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2018/12/24.
//  Copyright © 2018 何建新. All rights reserved.
//

import UIKit

class LoginModel: HandyJSON {
    var id:Int!;
    var user_nickname:String?;
    var user_phone:String?;
    var user_pwd:String?;
    var user_token:String?;
    var token_time_out:String?;
    var data:String;
    var msg:String?;
    required init() {}
}
