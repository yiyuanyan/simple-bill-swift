//
//  BaseViewController.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2018/12/21.
//  Copyright © 2018 何建新. All rights reserved.
//

import UIKit
import SnapKit
class BaseViewController: UIViewController {
    var topView = BaseTopView();
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "简单记账";
        let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 24)];
        self.navigationController?.navigationBar.titleTextAttributes = (dict as! [NSAttributedString.Key : Any]);
        self.view.backgroundColor = UICOLOR_FROM_HEX(hex: 0xfefefe);
        setTopView();
    }
    func setTopView() {
        //topView = BaseTopView();
        self.view.addSubview(topView);
        topView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(0);
            make.left.equalTo(self.view.snp.left).offset(0);
            make.right.equalTo(self.view.snp.right).offset(0);
            make.height.equalTo(LineH(l: 172));
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
