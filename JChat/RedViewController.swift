//
//  RedViewController.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/6.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    
    var redBlock : (()->Void)? //红包回调

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellow

        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.setTitle("我要发红包了", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(sendRedPackage), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.mas_makeConstraints { (make) in
            make?.center.equalTo()(self.view)
            make?.width.equalTo()(200)
            make?.height.equalTo()(40)
        }
        
    }
    

    //MARK: 发送红包
    @objc fileprivate func sendRedPackage() {
        
        redBlock?()
        self.dismiss(animated: true, completion: nil)
        
    }


}
