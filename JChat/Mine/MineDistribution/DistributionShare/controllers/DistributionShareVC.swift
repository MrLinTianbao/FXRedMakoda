//
//  PocketPay1VC.swift
//  XLCustomer
//
//  Created by longma on 2019/1/9.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class DistributionShareVC: CTViewController {
    
    @IBOutlet weak var viewBubb: UIView!
    @IBOutlet weak var imvHead: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUIAppearance()
        
    }
    func setUIAppearance(){
        self.title = "分销"
        self.setNavRightItem(title: "邀请记录", titleColor: UIColor.KTheme.deepOrange)
        self.view.backgroundColor = UIColor.KTheme.scroll
        viewBubb.clipsToBounds = false
      
    }
    override func actionRightItemClick() {
        self.pushViewController(targetStr: "DistributionRecordVC")
    }
    

   

}
