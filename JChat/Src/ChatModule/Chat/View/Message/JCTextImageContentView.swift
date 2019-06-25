//
//  JCBusinessCardContentView.swift
//  JChat
//
//  Created by JIGUANG on 2017/8/31.
//  Copyright © 2017年 HXHG. All rights reserved.
//

import UIKit

class JCTextImageContentView: UIView, JCMessageContentViewType {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        _commonInit()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _commonInit()
    }
    
    open func apply(_ message: JCMessageType) {
        guard let content = message.content as? JCTextImageContent else {
            return
        }
    
        _message = message
        _delegate = content.delegate
        _userName = content.userName
        _appKey = content.appKey
        _image = content.image
        _sendText = content.sendText
        
        titleLabel.text = "@" + (_userName ?? "")
        textLabel.text = _sendText
        
        
        
        
        imageView.image = self._image
        
        let size = self._image?.size
        let scale = min(min(160, (size?.width)!) / (size?.width)!, min(160, (size?.height)!) / (size?.height)!)
        let width = (size?.width)! * scale
        let height = (size?.height)! * scale
        
        let multiple = width/height
        
        var w = width
        var h = height
        
        if w < 150 {
            w = 150
            h = 150 / multiple
        }
        
        let titleH = _userName?.size(font: 14, width: w).height
        
        let textH = _sendText?.size(font: 12, width: w).height
        
        titleLabel.frame = CGRect.init(x: 0, y: 0, width: w, height: titleH!)
        
        imageView.frame = CGRect.init(x: 0, y: titleH!, width: w, height: h)
        
        textLabel.frame = CGRect.init(x: 0, y: titleH!+h, width: w, height: textH!)
        
        
        
        
//        if let userName = _userName {
//            JMSGUser.userInfoArray(withUsernameArray: [userName], completionHandler: { (result, error) in
//                let users = result as? [JMSGUser]
//                guard let user = users?.first else {
//                    return
//                }
//                self._user = user
//
//
//            })
//        }
    }
    
    fileprivate lazy var titleLabel : UILabel = {
      
        let titleLabel = UILabel.init(frame: .init(x: 0, y: 0, width: 200, height: 30))
        titleLabel.textColor = UIColor(netHex: 0x989898)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.numberOfLines = 0
        
        return titleLabel
        
    }()
    
    fileprivate lazy var imageView : UIImageView = {
        
        let imageView = UIImageView.init(frame: .init(x: 0, y: 30, width: 200, height: 100))
        return imageView
    }()
    
    fileprivate lazy var textLabel : UILabel = {
        
        let textLabel = UILabel.init(frame: .init(x: 0, y: 130, width: 200, height: 30))
        textLabel.numberOfLines = 0
        textLabel.textColor = UIColor.black
        textLabel.font = UIFont.systemFont(ofSize: 12)
        textLabel.text = "发送的消息内容"
        
        return textLabel
    }()
    
    
    
    private weak var _delegate: JCMessageDelegate?
    
    private var _size : CGSize?
    private var _sendText: String?
    private var _image: UIImage?
    private var _userName: String?
    private var _appKey: String?
    private var _nickname: String?
    private var _message: JCMessageType!
    private var _user: JMSGUser?
    

    
    private func _commonInit() {
        _tapGesture()

        addSubview(titleLabel)
        addSubview(imageView)
        addSubview(textLabel)

    }
    
    func _tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(_clickCell))
        tap.numberOfTapsRequired = 1
        addGestureRecognizer(tap)
    }
    
    @objc func _clickCell() {

        _delegate?.message?(message: _message, image: _image)
    }

}
