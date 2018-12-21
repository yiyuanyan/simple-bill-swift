//
//  AppInformation.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2018/12/21.
//  Copyright © 2018 何建新. All rights reserved.
//

import Foundation
import UIKit





func IsStrEmpty(str:String) -> Bool {
    
    
    return str.isEmpty || str == "";
}

/**
 @abstract 获取本机屏幕的宽度.   考虑到横屏的宽高比
 */
func SCREEN_HEIGHT()->CGFloat{
    return (UIScreen.main.bounds.size.height > UIScreen.main.bounds.size.width) ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width;
    
}
/**
 @abstract 获取本机屏幕的高度.   考虑到横屏的宽高比
 **/
func SCREEN_WIDTH() -> CGFloat {
    return (UIScreen.main.bounds.size.height > UIScreen.main.bounds.size.width) ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width;
}
/**
 @abstract 判断本机是否为iPhone6
**/
let IS_IPHONE4 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 960).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE5 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 1136).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE6 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 750, height: 1334).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE6_PLUS =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo((UIScreen.main.currentMode?.size)!) : false)


let IS_IPHONE6_PLUS_SCALE =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2001).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE_X =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IS_IPHONE_XR = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 828, height: 1792).equalTo((UIScreen.main.currentMode?.size)!) : false)
let IS_IPHONE_Xs_Max = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2688).equalTo((UIScreen.main.currentMode?.size)!) : false)
//判断iPhoneX所有系列
let IS_IPhoneX_All =  (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_Xs_Max)


/*比例*/
//状态栏高度
let STATUS_BAR_HEIGHT = (IS_IPhoneX_All ? 44.0 : 20.0)
//导航高度
let NAVIGATION_BAR_HEIGHT = (IS_IPhoneX_All ? 88.0 : 64.0)
//tabbar高度
let TAB_BAR_HEIGHT = (IS_IPhoneX_All ? (49.0 + 34.0) : 49.0)
//home indicator---以前home键部分
let HOME_INDICATOR_HEIGHT = (IS_IPhoneX_All ? 34.0 : 0.0)
//内容显示高度
let CONTENT_HEIGHT = (Double(SCREEN_HEIGHT()) - TAB_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT - 88)
let XMGScaleY = (IS_IPhoneX_All ? SCREEN_HEIGHT()/667.0 : 667.0/667.0)
let XMGScaleX = SCREEN_WIDTH() / 375.0

// X坐标
func LineX(l:CGFloat) -> CGFloat {
    return l*XMGScaleX;
}
//width比例
func LineW(l:CGFloat)->CGFloat {
    return l*XMGScaleX;
}
// Y坐标
func LineY(l:CGFloat) -> CGFloat {
    return l*XMGScaleY;
}
//height比例
func LineH(l:CGFloat) -> CGFloat {
    return l*XMGScaleY;
}
func Font(x:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: x*XMGScaleX);
}

/**
 @abstract 根据HEX值来获取UICOLOR
**/
func UICOLOR_FROM_HEX(hex:NSInteger) -> UIColor {
    return UIColor.init(red: CGFloat((Float((hex & 0xFF0000) >> 16))/255.0), green: CGFloat((Float((hex & 0xFF00) >> 8))/255.0), blue: CGFloat((Float(hex & 0xFF))/255.0), alpha: 1.0);
}
func UICOLOR_FROM_HEX_ALPHA(hex:NSInteger, alpha:Double)->UIColor {
    return UIColor.init(red: CGFloat((Float((hex & 0xFF0000) >> 16))/255.0), green: CGFloat((Float((hex & 0xFF00) >> 8))/255.0), blue: CGFloat((Float(hex & 0xFF))/255.0), alpha: CGFloat(alpha*0.01));
}
func UICOLOR_FROM_RGB(r:CGFloat, g:CGFloat, b:CGFloat)->UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0);
}
func UICOLOR_RANDOM_COLOR()->UIColor {
    return UICOLOR_FROM_RGB(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)));
}
