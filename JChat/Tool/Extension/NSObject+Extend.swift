//
//  NSObject+Extend.swift
//  CityTube
//
//  Created by DUONIU_MAC on 2019/6/5.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import Foundation
import UIKit
import YYModel

// MARK: - NSObject
extension NSObject {
    class func setModel(with dict:[String:Any]) -> Self {
        return self.yy_model(with: dict) ?? self.init()
    }
}
