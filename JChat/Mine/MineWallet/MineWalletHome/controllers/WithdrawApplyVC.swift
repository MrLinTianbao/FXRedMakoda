//
//  PocketPay1VC.swift
//  XLCustomer
//
//  Created by longma on 2019/1/9.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class WithdrawApplyVC: CTViewController {
    
    @IBOutlet weak var btnApply: MJButton!
    @IBOutlet weak var tfMoney: MJUITextField!
    @IBOutlet weak var tfBankName: MJUITextField!
    @IBOutlet weak var tfID: MJUITextField!
    @IBOutlet weak var tfName: MJUITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUIAppearance()
        
    }
    func setUIAppearance(){
        self.title = "提现申请"
        self.view.backgroundColor = UIColor.KTheme.scroll
        tfMoney.adjustsFontSizeToFitWidth = true
        tfBankName.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)
        tfID.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)
        tfName.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)
        tfMoney.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)

        tfID.keyboardType = .numberPad
        tfMoney.keyboardType = .numbersAndPunctuation
    }
    @objc func textValueChanged(){
        btnApply.isClickEnabled = !(tfBankName.isEmpty) && !(tfID.isEmpty) && !(tfName.isEmpty) && !(tfMoney.isEmpty)
    }
    @IBAction func onApplyBtnClicked(_ sender: Any) {
    }
    

   

}
