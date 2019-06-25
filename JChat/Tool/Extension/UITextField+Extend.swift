//
//  UITextField+Extend.swift
//  CityTube
//
//  Created by DUONIU_MAC on 2019/6/5.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    convenience init(Width:CGFloat) {
        self.init()
        
        //设置左边距
        self.leftView = UIView.init(frame: .init(x: 0, y: 0, width: Width, height: 0))
        
        //设置右边距
        self.rightView = UIView.init(frame: .init(x: 0, y: 0, width: Width, height: 0))
        //设置显示模式为永远显示(默认不显示 必须设置 否则没有效果)
        
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
    
    @IBInspectable public var phColor : String? {
        get {
            return nil
        }
        set {
            if let newValue = newValue {

    
                let placeholder = NSMutableAttributedString.init(string: self.placeholder ?? "")
                placeholder.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.KTheme.color(with: newValue), range: NSRange.init(location: 0, length: (self.placeholder?.length)!))
                
                self.attributedPlaceholder = placeholder
                
            }
            
        }
    }
}
