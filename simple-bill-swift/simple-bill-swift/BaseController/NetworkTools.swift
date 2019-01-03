//
//  NetworkTools.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2019/1/2.
//  Copyright © 2019 何建新. All rights reserved.
//

import UIKit

class NetworkTools: NSObject {
    public enum Method:String{
        case options = "OPTIONS"
        case get = "get"
        case post = "post"
    }
    public static func share(met:HTTPMethod,baseUrl:String, action:String, header:Bool, params:String, success : @escaping (_ responseObject : String) -> (), failure : @escaping (_ error : NSError) -> ()) -> (){
        let sing = action + "/" + params + "/" + SINGKEY;
        let singMD5 = sing.md5();
        var token:String?
        if(header == true){
            token = (UserDefaults.standard.string(forKey: "token") != nil) ? UserDefaults.standard.string(forKey: "token") : "";
        }else{
            token = "";
        }
        let headers: HTTPHeaders = [
            "token": token!,
            "Accept": "application/json"
        ]
        let url = BASE_URL + action + "/" + params + "/" + singMD5;
        Alamofire.request(url, method: met, parameters: nil, encoding: URLEncoding.default, headers: headers).responseString { (response) in
            
            if response.result.isSuccess {
                
                if let RSAString = response.result.value {
                    
                    //进行RSA解密.解密后是json字符串
                    let jsonString = RSADecrypt(string: RSAString);

                    if(!IsStrEmpty(str: jsonString)){
                        success(jsonString as String);

                    }else{
                        KRProgressHUD.showMessage("数据错误");
                    }
                    
                }
            }else{
                failure(response.result.error! as NSError);
            }
        }
    }
}
