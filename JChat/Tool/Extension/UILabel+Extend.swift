//
//  UILabel+Extend.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/23.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    @IBInspectable public var fontColor: String? {
        get {
            return nil
        }
        set {
            if let newValue = newValue {
                self.textColor = UIColor.KTheme.color(with: newValue)
            }
            
        }
    }
}
