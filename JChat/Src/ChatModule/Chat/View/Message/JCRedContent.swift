//
//  JCBusinessCardContent.swift
//  JChat
//
//  Created by JIGUANG on 2017/8/31.
//  Copyright © 2017年 HXHG. All rights reserved.
//

import UIKit

class JCRedContent: NSObject, JCMessageContentType {
    
    
    var delegate: JCMessageDelegate?
    

    public weak var redDelegate: JCRedMessageDelegate?
    open var layoutMargins: UIEdgeInsets = .zero
    
    open class var viewType: JCMessageContentViewType.Type {
        return JCRedContentView.self
    }
    
    open var isRecive = false
    open var amount : String?
    open var count : String?
    open var noteText : String?
    open var userName: String?
    open var appKey: String?
    
    open func sizeThatFits(_ size: CGSize) -> CGSize {
        return .init(width: 200, height: 87)
    }

}
