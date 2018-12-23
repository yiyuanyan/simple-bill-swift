//
//  BaseTabBarViewController.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2018/12/22.
//  Copyright © 2018 何建新. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.orange //tabbar 字体颜色
        tabBar.barTintColor = UIColor.white //tabbar 背景颜色
        
        self.view.backgroundColor = UICOLOR_RANDOM_COLOR();
        self.addChildVC(childVC: DetailedViewController(), childTitle: "详细", imageName: "activity", selectedImageName: "activity_select")
        self.addChildVC(childVC: ChartViewController(), childTitle: "图表", imageName: "dynamic", selectedImageName: "dynamic_select")
        self.addChildVC(childVC: AccountsViewController(), childTitle: "记账", imageName: "addition", selectedImageName: "addition_select")
        self.addChildVC(childVC: DiscoveredViewController(), childTitle: "发现", imageName: "coordinates", selectedImageName: "coordinates_select")
        self.addChildVC(childVC: MyViewController(), childTitle: "我的", imageName: "addressbook", selectedImageName: "addressbook_select")
        
        // Do any additional setup after loading the view.
    }
    
    /// 添加子控制器
    private func addChildVC(childVC: UIViewController, childTitle: String, imageName: String, selectedImageName:String)
    {
        let navigation = BaseNavigationController.init(rootViewController: childVC);
        
        let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        //标题颜色
        navigation.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : Any]
        navigation.navigationBar.isTranslucent = true
        //修改导航栏背景色
        //self.navigationController?.navigationBar.barTintColor = .orange;
        navigation.navigationBar.setBackgroundImage(UIImage(), for: .default);
        navigation.navigationBar.shadowImage = UIImage()
        
        childVC.title = childTitle
        childVC.tabBarItem.tag = 1
        childVC.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        self.addChild(navigation)
        
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
