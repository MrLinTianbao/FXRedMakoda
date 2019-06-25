//
//  PocketPay1VC.swift
//  XLCustomer
//
//  Created by longma on 2019/1/9.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class ForgetPayPasswardVC: CTViewController {
    @IBOutlet weak var tfPhone: MJUITextField!
    
    @IBOutlet weak var btnCode: UIButton!
    @IBOutlet weak var tfCode: MJUITextField!
    @IBOutlet weak var btnArea: UIButton!
    @IBOutlet weak var tfNewPw: MJUITextField!
    
    @IBOutlet weak var tfConfrimPw: MJUITextField!
    
    @IBOutlet weak var btnApply: MJButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUIAppearance()
        
    }
    func setUIAppearance(){
        self.title = "忘记支付密码"
        self.view.backgroundColor = UIColor.KTheme.scroll
        btnArea.addTarget(self, action: #selector(self.onAreaBtnClicked), for: .touchUpInside)
        btnArea.set(image: UIImage(named: "下下"), title: "地区", titlePosition: .left,
                      additionalSpacing: 2, state: .normal)
        btnCode.addTarget(self, action: #selector(self.onCodeBtnClicked), for: .touchUpInside)

        
        tfPhone.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)
        tfCode.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)
        tfNewPw.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)
        tfConfrimPw.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)

        tfNewPw.isSecureTextEntry = true
        tfConfrimPw.isSecureTextEntry = true
    }
    @objc func textValueChanged(){
        btnApply.isClickEnabled = !(tfCode.isEmpty) && !(tfNewPw.isEmpty) && !(tfConfrimPw.isEmpty) && !(tfPhone.isEmpty)
    }
    @objc func onCodeBtnClicked(){
        btnCode.mj_countDown(count: 10, enabledColor: UIColor.KTheme.deepOrange)
    }
    @objc func onAreaBtnClicked(){
        let selectTypeVC = SelectTypeViewController.init(dataArray: ["中国 +86","马来西亚 +60","泰国 +66","缅甸 +95","印度尼西亚 +62"], selectText: "中国 +86")
        selectTypeVC.modalPresentationStyle = .overCurrentContext
        selectTypeVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        selectTypeVC.textBlock = { [weak self] (text) in
            self?.btnArea.set(image: UIImage(named: "下下"), title: String(text.suffix(3)), titlePosition: .left,
                        additionalSpacing: 2, state: .normal)
        }
        self.present(selectTypeVC, animated: false, completion: nil)
    }
    
    @IBAction func onApplyBtnClicked(_ sender: Any) {
        
    }
    

   

}
