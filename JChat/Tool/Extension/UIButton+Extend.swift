//
//  UIButton+Extend.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/23.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    @IBInspectable public var textColor: String? {
        get {
            return nil
        }
        set {
            if let newValue = newValue {
                self.setTitleColor(UIColor.KTheme.color(with: newValue), for: .normal)
            }
            
        }
    }
}



//MARK: ******************************************************** MJ
extension UIButton {
    
    /// 计时器
    ///
    /// - Parameters:
    ///   - count: 时间秒数
    ///   - enabledColor: 禁止标题颜色
    public func mj_countDown(count: Int,enabledColor:UIColor){
        // 倒计时开始,禁止点击事件
        isEnabled = false
        
        // 保存当前的标题颜色
        let defaultColor = self.titleLabel?.textColor
        // 设置倒计时,标题颜色
        self.setTitleColor(enabledColor, for: .normal)
        
        var remainingCount: Int = count {
            willSet {
                setTitle("重新获取(\(newValue)s)", for: .normal)
                if newValue <= 0 {
                    setTitle("重新发送", for: .normal)
                }
            }
        }
        
        // 在global线程里创建一个时间源
        let codeTimer = DispatchSource.makeTimerSource(queue:DispatchQueue.global())
        // 设定这个时间源是每秒循环一次，立即开始
        codeTimer.schedule(deadline: .now(), repeating: .seconds(1))
        // 设定时间源的触发事件
        codeTimer.setEventHandler(handler: {
            
            // 返回主线程处理一些事件，更新UI等等
            DispatchQueue.main.async {
                // 每秒计时一次
                remainingCount -= 1
                // 时间到了取消时间源
                if remainingCount <= 0 {
                    self .setTitleColor(defaultColor, for: .normal)
                    self.isEnabled = true
                    codeTimer.cancel()
                }
            }
        })
        // 启动时间源
        codeTimer.resume()
    }
    
    
    
    /// 设置标题图片
    ///
    /// - Parameters:
    ///   - anImage: 图片
    ///   - title: 标题内容
    ///   - titlePosition: 标题位置
    ///   - additionalSpacing: 间隔距离
    ///   - state: 按钮状态
    func set(image anImage: UIImage?, title: String,
             titlePosition: UIView.ContentMode, additionalSpacing: CGFloat, state: UIControl.State){
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
        
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
    }
    
    func positionLabelRespectToImage(title: String, position: UIView.ContentMode,
                                     spacing: CGFloat) {
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}

