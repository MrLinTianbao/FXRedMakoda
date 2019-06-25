//
//  UIColor+Extend.swift
//  CityTube
//
//  Created by DUONIU_MAC on 2019/6/5.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    // MARK: 十六进制转rgb
    class func setRGB(_ rgbValue:UInt) -> UIColor {
        return UIColor.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: 1)
    }
    
    // MARK: rgb
    class func rgb(_ red: Int,_ green: Int,_ blue: Int, transparency: CGFloat = 1) -> UIColor{
        
        return UIColor.init(red: red, green: green, blue: blue, transparency: transparency)!
    }
}

extension UIColor {
    
    struct KTheme {
        /// 主色调 浅蓝色 rgb(22,175,220)
        static let main = UIColor.init(red: 22, green: 175, blue: 220)
        
        /// 正文颜色 黑色 rgb(34,34,34)
        static let dark = UIColor.setRGB(0x333333)
        
        /// 文本框水印颜色
        static let placeholder = UIColor.setRGB(0xC9C9C9)
        
        static let black = UIColor.setRGB(0x36373B)
        
        static let pink = UIColor.setRGB(0xE97C95)
        
        static let deepOrange = UIColor.setRGB(0xF85208)
        
        static let lightGray = UIColor.setRGB(0xE9E9E9)
        
        static let shallowOrange = UIColor.init(red: 247, green: 153, blue: 117)
        
        static let notice = UIColor.setRGB(0xF2F2F2)
        
        static let scroll = UIColor.setRGB(0xF2F2F2)
        
        static let deepGray = UIColor.setRGB(0x9B9B9B)
        
        static let shallowGray = UIColor.setRGB(0xC9C9C9)
        
        static let line = UIColor.setRGB(0xF2F2F2)
        
        /// 根据字符串获取颜色
        ///
        /// - Parameter name: 字符串
        /// - Returns: 颜色
        static func color(with name: String) -> UIColor {
            if name.contains("#") {
                
                return UIColor.init(hexString: name) ?? UIColor.black
                
            }
            else if name.contains("rgb") {
                
                if let subStr =  name.mj_stringBy(previousString: "(", laterString: ")") {
                    let arr = subStr.components(separatedBy: ",")
                    
                    return UIColor.rgb(Int(arr[0].mj_removeAllSapce)!, Int(arr[1].mj_removeAllSapce)!, Int(arr[2].mj_removeAllSapce)!)
                }else{
                    return UIColor.black
                }
                
                
            }else{
            
            switch name {
            case "main":
                return main
            case "dark":
                return dark
            case "placeholder":
                return placeholder
            case "black":
                return black
            case "pink":
                return pink
            case "shallowOrange":
                return shallowOrange
            case "deepOrange":
                return deepOrange
            case "notice":
                return notice
            case "scroll":
                return scroll
            case "lightGray":
                return lightGray
            case "deepGray":
                return deepGray
            case "shallowGray":
                return shallowGray
            case "line":
                return line
                
       
            default:
                return UIColor.black
            }
                
            }
        }
        
        
    }
}
