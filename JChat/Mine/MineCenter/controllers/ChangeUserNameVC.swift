//
//  PocketPay1VC.swift
//  XLCustomer
//
//  Created by longma on 2019/1/9.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class ChangeUserNameVC: CTViewController {
    
    
    @IBOutlet weak var tfName: MJUITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUIAppearance()
        
    }
    func setUIAppearance(){
        self.title = "修改昵称"
        self.view.backgroundColor = UIColor.KTheme.scroll
        self.setNavRightItem(title: "完成", titleColor: UIColor.init(hexString: "#E97C95")!)
    }
    
    

   

}
