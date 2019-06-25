//
//  MyDefine.swift
//  CityTube
//
//  Created by DUONIU_MAC on 2019/6/5.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import Foundation
import UIKit

/// 状态栏高度
var StatusBarHeight : CGFloat {
    return UIApplication.shared.statusBarFrame.size.height
}

/// 导航栏高度
var NAVBarHeight : CGFloat {
    return UINavigationController().navigationBar.bounds.size.height
}

/// 状态栏高度 + 导航栏高度
var StatusBarAddNavBarHeight : CGFloat {
    return StatusBarHeight + NAVBarHeight
}

/// 屏幕宽度
var ScreenW : CGFloat {
    return UIScreen.main.bounds.size.width
}

/// 屏幕高度
var ScreenH : CGFloat {
    return UIScreen.main.bounds.size.height
}

//MARK: 长度适配(以iPhone7为例)
func RATIO(_ num:CGFloat) -> CGFloat {
    return num * ((UIScreen.main.bounds.size.width) / 375.0)
}

func RATIO_H(_ num:CGFloat) -> CGFloat {
    return num * ((UIScreen.main.bounds.size.height) / 667.0)
}

func RATIO(maxNum:CGFloat) -> CGFloat {
    let a = maxNum * ((UIScreen.main.bounds.size.width) / 375.0)
    return a > maxNum ? maxNum : a
}

func RATIO_H(maxNum:CGFloat) -> CGFloat {
    let a = maxNum * ((UIScreen.main.bounds.size.height) / 667.0)
    return a > maxNum ? maxNum : a
}

// MARK: - 打印方法
func MyLog<T>(_ message : T,file:String = #file,methodName: String = #function, lineNumber: Int = #line){
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    let dateForm = DateFormatter.init()
    dateForm.dateFormat = "HH:mm:ss:SSS"
    print("[\(fileName)][\(lineNumber)][\(dateForm.string(from: Date()))]\(methodName):\(message)")
    #endif
    
}
