//
//  SignUpViewController.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/22.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class SignUpViewController: CTViewController {
    
    @IBOutlet weak var areaBtn: UIButton!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var downImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.view.setBackgroundImage(string: "sign_bg")

    }

    //MARK: 立即登录
    @IBAction func toSignIn(_ sender: UIButton) {
        
        self.navigationController?.popViewController()
    }
    
    //MARK: 注册
    @IBAction func signUpAction(_ sender: UIButton) {
        
        phoneTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        let userName = phoneTextField.text!.trimed()
        let passWord = passwordTextField.text!.trimed()
        
        
        
        let validateUsername = UserDefaultValidationService.sharedValidationService.validateUsername(userName)
        if !(validateUsername == .ok) {
            MBProgressHUD_JChat.show(text: validateUsername.description, view: view)
            return
        }
        
        let validatePassword = UserDefaultValidationService.sharedValidationService.validatePassword(passWord)
        if !(validatePassword == .ok) {
            MBProgressHUD_JChat.show(text: validatePassword.description, view: view)
            return
        }
        
        MBProgressHUD_JChat.showMessage(message: "注册中", toView: view)
        
        JMSGUser.register(withUsername: userName, password: passWord) { (result, error) in
            let _ = DispatchQueue.main.async {
                MBProgressHUD_JChat.hide(forView: self.view, animated: true)
                if error == nil {
                    let vc = JCRegisterInfoViewController()
                    vc.username = userName
                    vc.password = passWord
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    MBProgressHUD_JChat.show(text: String.errorAlert(error! as NSError), view: self.view)
                }
            }
        }
    }
    
    //MARK: 文本变化
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        
        if phoneTextField.text != "" && codeTextField.text != "" && passwordTextField.text != "" {
            
            signUpBtn.backgroundColor = UIColor.KTheme.deepOrange
            signUpBtn.isEnabled = true
            
        }else{
            
            signUpBtn.backgroundColor = UIColor.KTheme.shallowOrange
            signUpBtn.isEnabled = false
        }
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
    
}
