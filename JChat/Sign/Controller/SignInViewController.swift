//
//  SignInViewController.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/22.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class SignInViewController: CTViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    @IBOutlet weak var areaBtn: UIButton!
    
    @IBOutlet weak var downImage: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        self.view.backgroundColor = UIColor.green
        self.view.setBackgroundImage(string: "sign_bg")
        
        
    }
    
    //MAKR: 微信登录
    @IBAction func weChatSignIn(_ sender: UIButton) {
    }
    
    //MARK: 登录
    @IBAction func signInAction(_ sender: UIButton) {
        
        let username = phoneTextField.text!.trimed()
        let password = codeTextField.text!.trimed()
        
        let validateUsername = UserDefaultValidationService.sharedValidationService.validateUsername(username)
        if !(validateUsername == .ok) {
            MBProgressHUD_JChat.show(text: validateUsername.description, view: view)
            return
        }
        
        let validatePassword = UserDefaultValidationService.sharedValidationService.validatePassword(password)
        if !(validatePassword == .ok) {
            MBProgressHUD_JChat.show(text: validatePassword.description, view: view)
            return
        }
        
        MBProgressHUD_JChat.showMessage(message: "登录中", toView: view)
        JMSGUser.login(withUsername: username, password: password) { (result, error) in
            MBProgressHUD_JChat.hide(forView: self.view, animated: true)
            if error == nil {
                UserDefaults.standard.set(username, forKey: kLastUserName)
                JMSGUser.myInfo().thumbAvatarData({ (data, id, error) in
                    if let data = data {
                        let imageData = NSKeyedArchiver.archivedData(withRootObject: data)
                        UserDefaults.standard.set(imageData, forKey: kLastUserAvator)
                    } else {
                        UserDefaults.standard.removeObject(forKey: kLastUserAvator)
                    }
                })
                UserDefaults.standard.set(username, forKey: kCurrentUserName)
                UserDefaults.standard.set(password, forKey: kCurrentUserPassword)
                let appDelegate = UIApplication.shared.delegate
                let window = appDelegate?.window!
                window?.rootViewController = JCMainTabBarController()
            } else {
                MBProgressHUD_JChat.show(text: "\(String.errorAlert(error! as NSError))", view: self.view)
            }
        }
    }
    
    //MARK: 去注册
    @IBAction func toSignUp(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(SignUpViewController())
    }
    
    //MARK: 忘记密码
    @IBAction func forgetPassword(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(ForgetPasswordViewController(), animated: true)
    }
    
    //MARK: 文本变化
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        
        if phoneTextField.text != "" && codeTextField.text != "" {
            
            signInBtn.backgroundColor = UIColor.KTheme.deepOrange
            signInBtn.isEnabled = true
        }else{
            signInBtn.backgroundColor = UIColor.KTheme.shallowOrange
            signInBtn.isEnabled = false
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
