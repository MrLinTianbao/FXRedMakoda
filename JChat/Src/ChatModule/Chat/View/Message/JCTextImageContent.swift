//
//  JCBusinessCardContent.swift
//  JChat
//
//  Created by JIGUANG on 2017/8/31.
//  Copyright © 2017年 HXHG. All rights reserved.
//

import UIKit

class JCTextImageContent: NSObject, JCMessageContentType {

    public weak var delegate: JCMessageDelegate?
    open var layoutMargins: UIEdgeInsets = .zero
    
    open class var viewType: JCMessageContentViewType.Type {
        return JCTextImageContentView.self
    }
    
    var imageSize: CGSize?
    open var sendText: String?
    open var image: UIImage?
    open var userName: String?
    open var appKey: String?
    
    open func sizeThatFits(_ size: CGSize) -> CGSize {
        if image == nil {
            image = UIImage.createImage(color: UIColor(netHex: 0xCDD0D1), size: imageSize ?? CGSize(width: 160, height: 160))
        }
        let size = imageSize ?? (image?.size)!
        let scale = min(min(160, size.width) / size.width, min(160, size.height) / size.height)
        
        let width = size.width * scale
        let height = size.height * scale
        
        let multiple = width/height
        
        var w = width
        var h = height
        
        if w < 150 {
            w = 150
            h = 150 / multiple
        }
        
        let titleH = userName?.size(font: 14, width: w).height
        
        let textH = sendText?.size(font: 12, width: w).height
        
        return .init(width: w, height: h + titleH! + textH!)
    }

}
