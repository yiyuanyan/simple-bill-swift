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
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                //print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                
                return .success
            }
            .responseJSON { response in
                //debugPrint();
                
                
        }
        
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
