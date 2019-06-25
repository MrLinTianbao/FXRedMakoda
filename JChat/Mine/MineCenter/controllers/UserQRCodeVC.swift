//
//  PocketPay1VC.swift
//  XLCustomer
//
//  Created by longma on 2019/1/9.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class UserQRCodeVC: CTViewController {
    @IBOutlet weak var labName: UILabel!
    
    @IBOutlet weak var imvCode: UIImageView!
    @IBOutlet weak var labID: UILabel!
    @IBOutlet weak var imvIcon: UIImageView!
    @IBOutlet weak var viewCenterH: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUIAppearance()
        
    }
    func setUIAppearance(){
        self.title = "我的二维码"
        self.view.backgroundColor = UIColor.KTheme.scroll
        
        let w = 110 + (ScreenW - (42+24)*2) + 50
        viewCenterH.constant = w
        
    }
   
    
    

   

}
