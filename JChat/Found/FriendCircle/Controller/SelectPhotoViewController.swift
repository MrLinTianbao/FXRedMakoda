//
//  SelectPhotoViewController.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/24.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class SelectPhotoViewController: CTViewController {
    
    var photoBlock : ((String)->Void)?
    
    fileprivate var titleArray = [String]()
    
    init(titleArray:[String]?=["从手机相册选择","拍摄"]) {
        super.init(nibName: nil, bundle: nil)
    
        self.titleArray = titleArray!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        let cancelBtn = UIButton.init(frame: .init(x: 0, y: ScreenH-56, width: ScreenW, height: 56))
        cancelBtn.backgroundColor = UIColor.white
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.setTitleColor(UIColor.setRGB(0x6F6F6F), for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancelBtn.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        self.view.addSubview(cancelBtn)
        
        var y = ScreenH-64
        
        for i in 0..<titleArray.count {
            
            y -= 57
            
            let btn = UIButton.init(frame: .init(x: 0, y: y, width: ScreenW, height: 56))
            btn.backgroundColor = UIColor.white
            btn.setTitle(titleArray[i], for: .normal)
            btn.setTitleColor(UIColor.setRGB(0x6F6F6F), for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            btn.addTarget(self, action: #selector(selectOpert(sender:)), for: .touchUpInside)
            self.view.addSubview(btn)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.dismiss(animated: false, completion: nil)
    }
    
    //MARK: 取消
    @objc fileprivate func dismissAction() {
        
        self.dismiss(animated: false, completion: nil)
    }
    
    //MARK: 选择操作
    @objc fileprivate func selectOpert(sender:UIButton) {
        
        self.photoBlock?(sender.titleLabel?.text ?? "")
        self.dismiss(animated: false, completion: nil)
    }
    

}
