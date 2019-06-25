//
//  AlertClass.swift
//  CityTube
//
//  Created by DUONIU_MAC on 2019/6/5.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import UIKit


class AlertClass: NSObject {

    // MARK: - 提醒操作
    // MARK: 只有一个按钮的提醒操作
    /// 只有一个按钮的提醒操作
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - msg: 提示信息
    ///   - target: 显示在哪个控制器上
    ///   - actionTitle: 动作按钮标题
    ///   - cancelTitle: 取消按钮标题
    ///   - haveCancel: 是否有取消按钮
    ///   - handler: 点击确定后的操作
    @objc static func setAlertView(title:String? = global_systemAlert,msg:String? , target:UIViewController? ,actionTitle:String? = global_confirm,cancelTitle:String? = global_cancel,haveCancel:Bool , handler:((UIAlertAction) -> Void)?) {
        let alertView = UIAlertController.init(title: title, message: msg, preferredStyle: .alert)
        
        let enterAction = UIAlertAction.init(title: actionTitle, style: .default) { (alertView) in
            handler?(alertView)
        }
        
        if haveCancel {
            let cancelAction = UIAlertAction.init(title: cancelTitle, style: .cancel, handler: nil)
            alertView.addAction(cancelAction)
        }
        alertView.addAction(enterAction)
        target?.present(alertView, animated: true, completion: nil)
        
    }
    
    // MARK: - 提醒操作
    /// - Parameters:
    ///   - title: 标题
    ///   - msg: 提示信息
    ///   - target: 显示在哪个控制器上
    ///   - actionTitle: 动作按钮标题
    ///   - cancelTitle: 取消按钮标题
    ///   - handler: 点击确定后的操作
    @objc static func setBottomAlertView(title:String? = global_systemAlert,msg:String? , target:UIViewController? ,actionTitle:[String],cancelTitle:String? = global_cancel,handler:((UIAlertAction) -> Void)?) {
        
        let alertView = UIAlertController.init(title: title, message: msg, preferredStyle: .actionSheet)
        
        for i in 0..<actionTitle.count {
            
            let action = UIAlertAction.init(title: actionTitle[i], style: .default) { (alert) in
                handler?(alert)
            }
            
            alertView.addAction(action)
        }
        
        
        let cancelAction = UIAlertAction.init(title: global_cancel, style: .cancel) { (alert) in
            
            handler?(alert)
        }
        
        alertView.addAction(cancelAction)
        
        target?.present(alertView, animated: true, completion: nil)
    }
    
    // MARK: - 设置刷新
    static func setRefresh(with scrollView :UIScrollView ,headerAction : (()->Void)? , footerAction : (()->Void)? ) {
        
        //下拉刷新
        let header = MJRefreshNormalHeader.init(refreshingBlock: headerAction)
        scrollView.mj_header = header
        
        header?.activityIndicatorViewStyle = .gray
        header?.stateLabel.textColor = .gray
        
        
        if footerAction == nil {
            return
        }
        
        //上拉加载
        let footer =  MJRefreshBackNormalFooter.init(refreshingBlock: footerAction)
        scrollView.mj_footer = footer
        
        footer?.activityIndicatorViewStyle = .gray
        footer?.stateLabel.textColor = .gray
        
    }
    
    //MARK: 自定义弹框
    static func showText(_text:String) {
        
        let windwow = UIApplication.shared.keyWindow
        let showView = UIView()
        showView.backgroundColor = UIColor.black
        showView.frame = CGRect.init(x: 1, y: 1, width: 1, height: 1)
        
        showView.layer.cornerRadius = 5.0
        showView.layer.masksToBounds = true
        windwow?.addSubview(showView)
        
        let label = UILabel()
        let size = _text.size(font: RATIO(maxNum: 14), width: RATIO(maxNum: 300))
        label.frame = .init(x: 0, y: 0, width: size.width, height: size.height)
        label.text = _text
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: RATIO(maxNum: 14))
        label.numberOfLines = 0
        
        showView.addSubview(label)
        
        showView.frame = .init(x: (ScreenW-size.width)/2, y: ScreenH - size.height - 20, width: size.width, height: size.height)
        
        UIView.animate(withDuration: 0.2, delay: 1, options: .curveLinear, animations: {
            
            showView.alpha = 0
            
        }) { (true) in
            
            showView.removeFromSuperview()
        }
        
    }
    
    // MARK: - 蒙版加载工具
    /// 显示加载动画
    ///
    /// - Parameter text: 加载文字提示
    static func waiting(_ text:String = loading) {
        SVProgressHUD.show(withStatus: text + "...")
        SVProgressHUD.setDefaultMaskType(.black)
    }
    
    /// 停止加载动画
    static func stop() {
        SVProgressHUD.dismiss()
    }
}
