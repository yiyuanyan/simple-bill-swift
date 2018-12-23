//
//  BaseNavigationController.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2018/12/21.
//  Copyright © 2018 何建新. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //关闭导航栏半透明效果
        self.navigationController?.navigationBar.isTranslucent = true
        //修改导航栏背景色
        //self.navigationController?.navigationBar.barTintColor = .orange;
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default);
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        
        // Do any additional setup after loading the view.
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
