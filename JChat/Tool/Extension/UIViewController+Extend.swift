//
//  UIViewController+Extend.swift
//  CityTube
//
//  Created by DUONIU_MAC on 2019/6/5.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK: 设置错误提示框
    public func showErrorAlert(title :String? = "网络请求失败",msg:String? = "") {
        var errorStr = title
        if msg != "" {
            errorStr = global_requestFailed
        }
        
        AlertClass.showText(_text: errorStr!)
        //KMTool.setAlertView(title:errorStr, msg:msg, target: self, haveCancel: false, handler: nil)
    }
    
    //MARK: 判断页面是否存在
    public func isCurrentViewControllerVisible(viewcontroller:UIViewController) -> Bool {
        return viewcontroller.isViewLoaded && (viewcontroller.view.window != nil)
    }
    
}
