//
//  JCTool.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/10.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class JCTool: NSObject {

    //MARK: base64字符串转图片
    static func base64ToImage(base : String) -> UIImage {
        
        if base == "" {
            return UIImage()
        }
        
        let imageData = Data.init(base64Encoded: base)
        let image = UIImage.init(data: imageData!)
        
        return image!
    }
    
    //MARK: 图片转base64
    static func imageToBase64(image : UIImage) -> String {
        
        let imageData = image.pngData()

        let imageBase64String = imageData?.base64EncodedString()

        return imageBase64String!

    }
    
    //MARK: 自定义弹框
    static func showText(_text:String) {
        
        let windwow = UIApplication.shared.keyWindow
        let showView = UIView()
        showView.backgroundColor = UIColor.black
        showView.frame = CGRect.init(x: 1, y: 1, width: 1, height: 1)
        
        showView.layer.cornerRadius = 5.0
        showView.layer.masksToBounds = true
        windwow?.addSubview(showView)
        
        let label = UILabel()
        let size = _text.size(font: RATIO(maxNum: 14), width: RATIO(maxNum: 300))
        label.frame = .init(x: 0, y: 0, width: size.width, height: size.height)
        label.text = _text
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: RATIO(maxNum: 14))
        label.numberOfLines = 0
        
        showView.addSubview(label)
        
        showView.frame = .init(x: (ScreenW-size.width)/2, y: ScreenH - size.height - 20, width: size.width, height: size.height)
        
        UIView.animate(withDuration: 0.2, delay: 1, options: .curveLinear, animations: {
            
            showView.alpha = 0
            
        }) { (true) in
            
            showView.removeFromSuperview()
        }
        
        
        
    }
}
