//
//  AppDelegate.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2018/12/19.
//  Copyright © 2018 何建新. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initIQKeyboardManager();
        initKeyWindow();
        
        return true
    }
    
    func initKeyWindow() {
        self.window = UIWindow.init(frame: UIScreen.main.bounds);
        self.window?.backgroundColor = UICOLOR_FROM_HEX(hex: 0xfefefe);
        let login = LoginViewController();
        let tab = BaseTabBarViewController();
        let token = (UserDefaults.standard.string(forKey: UserDefaultKeys.LoginInfo().userToken) != nil) ? UserDefaults.standard.string(forKey: UserDefaultKeys.LoginInfo().userToken)! : ""
        let userPhone = (UserDefaults.standard.string(forKey: UserDefaultKeys.AccountInfo().userPhone) != nil) ? UserDefaults.standard.string(forKey: UserDefaultKeys.AccountInfo().userPhone)! : ""
        let userPwd = (UserDefaults.standard.string(forKey: UserDefaultKeys.AccountInfo().userPwd) != nil) ? UserDefaults.standard.string(forKey: UserDefaultKeys.AccountInfo().userPwd)! : ""
        if(!IsStrEmpty(str: token) && !IsStrEmpty(str: userPhone) && !IsStrEmpty(str: userPwd)){
            self.window?.rootViewController = tab;
        }else{
            self.window?.rootViewController = login;
        }
        
        
        
        
        self.window?.makeKeyAndVisible();
        
    }
    
    
    func initIQKeyboardManager() {
        let manager = IQKeyboardManager.shared;
        manager.enable = true;
        manager.shouldResignOnTouchOutside = true;
        manager.shouldToolbarUsesTextFieldTintColor = true;
        manager.enableAutoToolbar = false;
        manager.toolbarManageBehaviour = IQAutoToolbarManageBehaviour.byPosition;
        
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

