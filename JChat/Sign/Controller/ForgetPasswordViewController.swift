//
//  ForgetPasswordViewController.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/23.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: CTViewController {
    @IBOutlet weak var areaBtn: UIButton!
    
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var codeTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var confirmTF: UITextField!
    
    @IBOutlet weak var downImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setBackgroundImage(string: "sign_bg")
        self.view.addSubview(backButton)
    }
    
    fileprivate lazy var backButton : UIButton = {
      
        let button = UIButton.init(frame: .init(x: 20, y: 40, width: 25, height: 25))
        button.setBackgroundImage(string: "white_back")
        button.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc fileprivate func popAction() {
        
        self.navigationController?.popViewController()
    }

    //MARK: 获取验证码
    @IBAction func getCode(_ sender: UIButton) {
        
        
    }
    
    //MARK: 确认
    @IBAction func confirmAction(_ sender: UIButton) {
        
    
    }
    
    //MARK: 获取地区
    @IBAction func getArea(_ sender: UIButton) {
        
        let selectTypeVC = SelectTypeViewController.init(dataArray: ["中国 +86","马来西亚 +60","泰国 +66","缅甸 +95","印度尼西亚 +62"], selectText: "中国 +86")
        selectTypeVC.modalPresentationStyle = .overCurrentContext
        selectTypeVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        selectTypeVC.textBlock = { (text) in
            self.areaBtn.setTitle(String(text.suffix(3)), for: .normal)
            self.downImage.image = UIImage()
        }
        self.present(selectTypeVC, animated: false, completion: nil)
    }
    
    //MARK: 文本变化
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        
        if phoneTF.text != "" && codeTF.text != "" && passwordTF.text != "" && confirmTF.text != "" {
            
            confirmBtn.backgroundColor = UIColor.KTheme.deepOrange
            confirmBtn.isEnabled = true
            
        }else{
            
            confirmBtn.backgroundColor = UIColor.KTheme.shallowOrange
            confirmBtn.isEnabled = false
        }
        
    }
}
