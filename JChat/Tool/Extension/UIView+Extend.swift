//
//  MJStringExtend.swift
//  XLDoctor
//
//  Created by longma on 2018/12/28.
//  Copyright © 2018年 XLH. All rights reserved.
//

import Foundation
import UIKit

//MARK: ********************************************************  IB
extension UIView {
    @IBInspectable public var bgColorName: String? {
        get {
            return nil
        }
        set {
            if let newValue = newValue {
                self.backgroundColor = UIColor.KTheme.color(with: newValue)
            }
            
        }
    }
}
//MARK: ********************************************************  UI
extension UIView {
    
    /// 设置view的圆角
    ///
    /// - Parameter radius: 圆角半径
    func setCornerRadius(_ radius: CGFloat){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
    
    /// 给控件本身添加圆角
    ///
    /// - Parameters:
    ///   - corner: 添加哪些圆角
    ///   - cornerRadius: 圆角半径
    ///   - targetSize: 目标大小，即控件的frame.size
    func setCorner(_ corner: UIRectCorner, cornerRadius: CGFloat, size targetSize: CGSize) {
        let frame = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)
        let path = UIBezierPath(roundedRect: frame, byRoundingCorners: corner, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let layer = CAShapeLayer()
        layer.frame = frame
        layer.path = path.cgPath
        
        self.layer.mask = layer
    }
    
    /// 给控件本身添加圆角
    ///
    /// - Parameters:
    ///   - cornerRadius: 圆角半径
    ///   - corner: 添加哪些圆角
    func setCorner(cornerRadius: CGFloat, corner: UIRectCorner = .allCorners) {
        
        setCorner(corner, cornerRadius: cornerRadius, size: bounds.size)
    }

    func setBackgroundImage(string:String) {
        
        self.layer.contents = UIImage.init(named: string)?.cgImage
    }

}

//MARK: ********************************************************  frame
 extension UIView {
    
//    //获取视图的X坐标
//    public var x:CGFloat{
//        get{
//            return self.frame.origin.x;
//        }
//
//        set{
//            var frames = self.frame;
//            frames.origin.x = CGFloat(newValue);
//            self.frame = frames;
//        }
//    }
//
//    //获取视图的Y坐标
//    public var y:CGFloat{
//        get{
//            return self.frame.origin.y;
//        }
//
//        set{
//            var frames = self.frame;
//            frames.origin.y = CGFloat(newValue);
//            self.frame = frames;
//        }
//    }
//
//    //获取视图的宽
//    public var width:CGFloat{
//        get{
//            return self.frame.size.width;
//        }
//
//        set{
//            var frames = self.frame;
//            frames.size.width = CGFloat(newValue);
//            self.frame = frames;
//        }
//    }
//
//    //获取视图的高
//    public var height:CGFloat{
//        get{
//            return self.frame.size.height;
//        }
//
//        set{
//            var frames = self.frame;
//            frames.size.height = CGFloat(newValue);
//            self.frame = frames;
//        }
//    }
    
    // top
    var top:CGFloat {
        get {
            return frame.minY
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    // bottom
    var bottom:CGFloat {
        get {
            return frame.maxY
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    // left
    var left:CGFloat {
        get {
            return frame.minX
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    // right
    var right:CGFloat {
        get {
            return frame.maxX
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
  
    
    
    //获取最大的X坐标
    public var maxX:CGFloat{
        get{
            return self.x + self.width;
        }
        
        set{
            var frames = self.frame;
            frames.origin.x = CGFloat(newValue - self.width);
            self.frame = frames;
        }
    }
    
    //获取最大的Y坐标
    public var maxY:CGFloat{
        get{
            return self.y + self.height;
        }
        
        set{
            var frames = self.frame;
            frames.origin.y = CGFloat(newValue - self.height);
            self.frame = frames;
        }
    }
    
    //中心点X坐标
    public var centerX:CGFloat{
        get{
            return self.center.x;
        }
        set{
            self.center = CGPoint(x:CGFloat(newValue),y:self.center.y);
        }
    }
    
    //中心点Y坐标
    public var centerY:CGFloat{
        get{
            return self.center.y;
        }
        set{
            self.center = CGPoint(x:self.center.x,y:CGFloat(newValue));
        }
    }
    
    
}




