//
//  Data+Extend.swift
//  CityTube
//
//  Created by DUONIU_MAC on 2019/6/5.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import Foundation

//MARK: Data
extension Data {
    
    //此方法用于处理推送获取的token
    var DTHexString: String {
        
        return NSData.init(data: self).description.replacingOccurrences(of: "<", with: "").replacingOccurrences(of: ">", with: "").replacingOccurrences(of: " ", with: "")
        
    }
    
}
