//
//  LoginView.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2018/12/24.
//  Copyright © 2018 何建新. All rights reserved.
//

import UIKit

class LoginView: UIView {
    var phoneTextField = UITextField();
    var pwdTextField = UITextField();
    var loginButton = UIButton();
    override init(frame: CGRect) {
        super.init(frame: frame);
        initLoginViewUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initLoginViewUI() {
        self.backgroundColor = UICOLOR_FROM_HEX(hex: 0xffffff);
        let headerImage = UIImageView.init(image: UIImage.init(named: "head"));
        self.addSubview(headerImage);
        headerImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(LineH(l: 87));
            make.centerX.equalTo(self.snp.centerX);
            make.top.equalTo(self.snp.top).offset(LineY(l: 110));
        }
        let textFieldView = UIView();
        textFieldView.layer.borderColor = UICOLOR_FROM_HEX(hex: 0xd3d3d3).cgColor;
        textFieldView.layer.borderWidth = 1;
        textFieldView.layer.masksToBounds = true;
        textFieldView.layer.cornerRadius = 7;
        self.addSubview(textFieldView);
        textFieldView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX);
            make.width.equalTo(LineW(l: 300));
            make.height.equalTo(LineH(l: 108));
            make.top.equalTo(headerImage.snp.bottom).offset(LineY(l: 66));
        }
        let textFieldLine = UIView();
        textFieldLine.backgroundColor = UICOLOR_FROM_HEX(hex: 0xd3d3d3);
        textFieldView.addSubview(textFieldLine);
        textFieldLine.snp.makeConstraints { (make) in
            make.centerY.equalTo(textFieldView.snp.centerY);
            make.height.equalTo(1);
            make.left.right.equalTo(textFieldView);
        }
        self.phoneTextField.placeholder = "请输入您的手机号码";
        textFieldView.addSubview(self.phoneTextField);
        self.phoneTextField.snp.makeConstraints { (make) in
            make.top.right.equalTo(textFieldView);
            make.left.equalTo(textFieldView.snp.left).offset(LineX(l: 50));
            make.bottom.equalTo(textFieldLine.snp.top).offset(1);
        }
        let phoneIcon = UIImageView.init(image: UIImage.init(named: "user"));
        textFieldView.addSubview(phoneIcon);
        phoneIcon.snp.makeConstraints { (make) in
            make.width.height.equalTo(LineW(l: 20));
            make.left.equalTo(textFieldView.snp.left).offset(LineX(l: 15));
            make.centerY.equalTo(self.phoneTextField.snp.centerY);
        }
        self.pwdTextField.placeholder = "请输入您的密码";
        self.pwdTextField.isSecureTextEntry = true;
        textFieldView.addSubview(self.pwdTextField);
        self.pwdTextField.snp.makeConstraints { (make) in
            make.right.equalTo(textFieldView);
            make.left.equalTo(self.phoneTextField.snp.left).offset(0);
            make.bottom.equalTo(textFieldView.snp.bottom).offset(1);
            make.top.equalTo(textFieldLine.snp.bottom).offset(1);
        }
        let pwdIcon = UIImageView.init(image: UIImage.init(named: "pwd"));
        textFieldView.addSubview(pwdIcon);
        pwdIcon.snp.makeConstraints { (make) in
            make.width.equalTo(LineW(l: 14));
            make.height.equalTo(LineH(l: 15));
            make.centerX.equalTo(phoneIcon.snp.centerX);
            make.centerY.equalTo(self.pwdTextField.snp.centerY);
        }
        
        self.loginButton = UIButton();
        self.loginButton.setTitle("登  录", for: .normal);
        self.loginButton.setTitleColor(UICOLOR_FROM_HEX(hex: 0xffffff), for: .normal);
        
        self.loginButton.titleLabel?.font = Font(x: 22);
        self.loginButton.backgroundColor = UICOLOR_FROM_HEX(hex: 0x4768f3);
        self.loginButton.layer.masksToBounds = true;
        self.loginButton.layer.cornerRadius = 10;
        self.addSubview(self.loginButton);
        self.loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(LineW(l: 300));
            make.height.equalTo(LineH(l: 50));
            make.top.equalTo(textFieldView.snp.bottom).offset(LineY(l: 17));
            make.centerX.equalTo(self.snp.centerX);
        }
        
    }
    
    
    
}
