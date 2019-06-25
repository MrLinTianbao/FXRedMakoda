//
//  PocketPay1VC.swift
//  XLCustomer
//
//  Created by longma on 2019/1/9.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class ChangePayPasswardVC: CTViewController {
    @IBOutlet weak var tfOldPw: MJUITextField!
    
    @IBOutlet weak var tfNewPw: MJUITextField!
    
    @IBOutlet weak var tfConfrimPw: MJUITextField!
    
    @IBOutlet weak var btnApply: MJButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUIAppearance()
        
    }
    func setUIAppearance(){
        self.title = "修改密码"
        self.view.backgroundColor = UIColor.KTheme.scroll
        tfOldPw.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)
        tfNewPw.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)
        tfConfrimPw.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)

        tfNewPw.isSecureTextEntry = true
        tfConfrimPw.isSecureTextEntry = true
    }
    @objc func textValueChanged(){
        btnApply.isClickEnabled = !(tfOldPw.isEmpty) && !(tfNewPw.isEmpty) && !(tfConfrimPw.isEmpty)
    }
    @IBAction func onApplyBtnClicked(_ sender: Any) {
    }
    

   

}
