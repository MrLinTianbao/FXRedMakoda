//
//  JCMessageTextContentView.swift
//  JChat
//
//  Created by JIGUANG on 2017/3/9.
//  Copyright © 2017年 HXHG. All rights reserved.
//

import UIKit

open class JCMessageTextContentView: KILabel, JCMessageContentViewType {

//    var imageView : UIImageView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _commonInit()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _commonInit()
    }

    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return super.canPerformAction(action, withSender: sender)
    }
    
    open func apply(_ message: JCMessageType) {
        guard let content = message.content as? JCMessageTextContent else {
            return
        }
        
        self.attributedText = content.text
        
        
        
//        let jsonData:Data = content.text.string.data(using: .utf8)!
//        let dic = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
//        if let dict = dic as? [String:Any] {
//            if let type = dict["type"] as? String {
//                if type == "hb" {
//                    imageView.isHidden = false
//                    self.attributedText = NSAttributedString.init(string: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
//                    self.textColor = UIColor.clear
//                    imageView.frame = .init(x: self.frame.size.width-150, y: 0, width: 150, height: 150)
//
//                }
//            }
//        }else{
//            imageView.isHidden = true
//            self.attributedText = content.text
////            self.textColor = UIColor.black
//        }
        
        
        
        self.linkDetectionTypes = KILinkTypeOption.URL
        self.urlLinkTapHandler = { label, url, range in
            if let Url = URL(string: url) {
                if UIApplication.shared.canOpenURL(Url) {
                    UIApplication.shared.openURL(Url)
                } else {
                    let newUrl = URL(string: "https://" + url)
                    UIApplication.shared.openURL(newUrl!)
                }
            }
        }
    }
    
    private func _commonInit() {
        self.numberOfLines = 0
        
//        imageView = UIImageView.init(frame: .init(x: 0, y: 0, width: 150, height: 150))
//        imageView.image = UIImage.init(named: "hongbao_XIAO")!
//        imageView.isHidden = true
//        self.addSubview(imageView)
    }
}


