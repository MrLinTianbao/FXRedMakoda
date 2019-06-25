//
//  CTViewController.swift
//  CityTube
//
//  Created by DUONIU_MAC on 2019/6/5.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import UIKit

class CTViewController: UIViewController {
    
    /// 状态栏颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        //不让导航栏遮挡视图
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.view.backgroundColor = UIColor.white
        //修改返回按钮图片
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back_arrow")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back_arrow")
        //修改返回按钮文字
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        
        //导航栏背景颜色
//        self.navigationController?.navigationBar.barTintColor = UIColor.red
        
        //字体颜色
//        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        //字体大小
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black,NSAttributedString.Key.font : UIFont.systemFont(ofSize: RATIO(maxNum: 18))]

    }
    
    /// 根据target 字符串跳转控制器
    ///
    /// - Parameter targetStr: 控制器字符串
    func pushViewController(targetStr:String){
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String//这是获取项目的名称，
        let className=clsName! + "." + targetStr
        let viewC = NSClassFromString(className)!as! UIViewController.Type //这里需要指定类的类型XX.Type
        let vc =  viewC.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setNavRightItem(title: String,titleColor:UIColor = UIColor.KTheme.black) {
        
        let navRightItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(self.actionRightItemClick))
        navRightItem.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),NSAttributedString.Key.foregroundColor: titleColor], for: .normal)
        navRightItem.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),NSAttributedString.Key.foregroundColor: titleColor], for: .highlighted)
        
        navigationItem.rightBarButtonItem = navRightItem
        
    }
    
    @objc public func actionRightItemClick() {
        
        
    }

}
