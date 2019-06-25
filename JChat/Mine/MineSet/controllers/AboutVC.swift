//
//  PocketPay1VC.swift
//  XLCustomer
//
//  Created by longma on 2019/1/9.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class AboutVC: CTViewController {
    
    @IBOutlet weak var txvTips: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUIAppearance()
        
    }
    func setUIAppearance(){
        self.title = "关于我们"
        txvTips.textColor = UIColor.rgb(164, 164, 164)
        txvTips.text = "这这是关于这是关于这是关于这是关于这 这是关于这是关于这是关于这是关于这是关于 这是关于这是"
        txvTips.isEditable = false
    }


   

}
