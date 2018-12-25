//
//  LoginViewController.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2018/12/22.
//  Copyright © 2018 何建新. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var loginView = LoginView(frame: CGRect.init());
    var model = LoginModel();
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UICOLOR_RANDOM_COLOR();
        initLoginView();
    }
    func initLoginView() {
        self.view.addSubview(loginView);
        loginView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self.view).offset(0);
        }
        loginView.loginButton.reactive.controlEvents(.touchUpInside).observeValues { (button) in
            if(!isTelNumber(num: self.loginView.phoneTextField.text! as NSString)){
                KRProgressHUD.showMessage("手机号码不正确")
            }
            if((self.loginView.pwdTextField.text?.count)! < 6){
                KRProgressHUD.set(style: .black).showMessage("密码必须大于6位");
            }
            self.httpTool();
        }
    }
    func httpTool(){
        
        let url = LOGIN_PATH + self.loginView.phoneTextField.text! + "/" + self.loginView.pwdTextField.text!;
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseString { (response) in
            
            if response.result.isSuccess {
                print(response);
                if let jsonString = response.result.value {
                    
                    /// json转model
                    /// 写法一：responseModel.deserialize(from: jsonString)
                    let model = LoginModel.deserialize(from: jsonString)
                    if(model?.status == 1){
                        self.sysUserDefault(model: model!);
                    }else{
                        KRProgressHUD.showMessage((model?.msg)!);
                    }
                }
            }
        }

        
    }
    
    func sysUserDefault(model:LoginModel) -> Void {
        let defaultStand = UserDefaults.standard;
        defaultStand.set(model.data!["u_id"], forKey: UserDefaultKeys.AccountInfo().uid);
        defaultStand.set(model.data!["user_phone"], forKey: UserDefaultKeys.AccountInfo().userPhone);
        defaultStand.set(model.data!["user_pwd"], forKey: UserDefaultKeys.AccountInfo().userPwd);
        defaultStand.set(model.data!["user_nickname"], forKey: UserDefaultKeys.AccountInfo().userNickName);
        defaultStand.set(model.data!["user_token"], forKey: UserDefaultKeys.LoginInfo().userToken);
        defaultStand.set(model.data!["token_time_out"], forKey: UserDefaultKeys.LoginInfo().userTokenTimeOut);
        //self.view.window?.rootViewController = DetailedViewController();
        self.present(DetailedViewController(), animated: true, completion: nil);
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
