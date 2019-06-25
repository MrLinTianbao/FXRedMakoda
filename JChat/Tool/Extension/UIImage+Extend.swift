//
//  UIImage+Extend.swift
//  CityTube
//
//  Created by DUONIU_MAC on 2019/6/5.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension UIImage {
    
    //MARK: 颜色转图片
    class func imageWithColor( _ color:UIColor) -> UIImage {
        
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

extension UIImageView {
    public func setUrlImage(with urlStr:String? ,placeholder: UIImage?){
        
        self.sd_setImage(with: URL.init(string: urlStr ?? ""), placeholderImage: placeholder)
    }
}


