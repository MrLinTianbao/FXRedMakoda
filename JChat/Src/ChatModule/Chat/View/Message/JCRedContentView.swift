//
//  JCBusinessCardContentView.swift
//  JChat
//
//  Created by JIGUANG on 2017/8/31.
//  Copyright © 2017年 HXHG. All rights reserved.
//

import UIKit

class JCRedContentView: UIView, JCMessageContentViewType {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        _commonInit()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _commonInit()
    }
    
    open func apply(_ message: JCMessageType) {
        guard let content = message.content as? JCRedContent else {
            return
        }
        
        isRecive = content.isRecive
        _message = message
        _delegate = content.redDelegate
        _userName = content.userName
        _appKey = content.appKey
        
        noteText = content.noteText
        amount = content.amount
        count = content.count
        
        if noteText == "" || noteText == nil {
            titleLabel.text = "恭喜发财，大吉大利"
        }else{
            
            titleLabel.text = noteText
        }
        
        if isRecive{
            titleLabel.text = "已被领取"
        }
        
        
        
        
        
//        if let userName = _userName {
//            JMSGUser.userInfoArray(withUsernameArray: [userName], completionHandler: { (result, error) in
//                let users = result as? [JMSGUser]
//                guard let user = users?.first else {
//                    return
//                }
//                self._user = user
//
//                if user.nickname != nil && !user.nickname!.isEmpty {
////                    self.nickNameLabel.text = user.nickname
////                    self.nickNameLabel.frame = CGRect(x: 62, y: 11.5, width: 126, height: 22.5)
//                } else {
//                    self.titleLabel.text = ""
////                    self.nickNameLabel.text = user.username
////                    self.nickNameLabel.frame = CGRect(x: 62, y: 22.5, width: 126, height: 22.5)
//                }
//
//                user.thumbAvatarData({ (data, msgId, error) in
//                    if let data = data {
//                        self.imageView.image = UIImage(data: data)
//                    } else {
//                        self.imageView.image = UIImage.loadImage("com_icon_user_40")
//                    }
//                })
//            })
//        }
    }
    
    
    private weak var _delegate: JCRedMessageDelegate?
    
    private var isRecive = false
    private var noteText : String?
    private var amount : String?
    private var count : String?
    private var _userName: String?
    private var _appKey: String?
    private var _nickname: String?
    private var _message: JCMessageType!
    private var _user: JMSGUser?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 12, y: 13.5, width: 30, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.init(named: "hongbao_XIAO")//UIImage.loadImage("com_icon_user_40")
        return imageView
    }()
//    private lazy var line: UILabel = {
//        let line = UILabel()
//        line.frame = CGRect(x: 10, y: 66, width: 180, height: 1)
//        line.layer.backgroundColor = UIColor(netHex: 0xE8E8E8).cgColor
//        return line
//    }()
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 50, y: 13.5, width: 140, height: 40)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.white
        return titleLabel
    }()
    
    private lazy var bgView: UIImageView = {
            let bgView = UIImageView()
            bgView.frame = CGRect(x: 0, y: 0, width: 200, height: 67)
            bgView.backgroundColor = UIColor.init(red: 237/255.0, green: 161/255.0, blue: 80/255.0, alpha: 1)
            return bgView
    }()
    
//    private lazy var nickNameLabel: UILabel = {
//        let nickNameLabel = UILabel()
//        nickNameLabel.frame = CGRect(x: 62, y: 11.5, width: 126, height: 22.5)
//        nickNameLabel.font = UIFont.systemFont(ofSize: 16)
//        nickNameLabel.textColor = .black
//        return nickNameLabel
//    }()
    private lazy var tipsLabel: UILabel = {
        let tipsLabel = UILabel()
        tipsLabel.backgroundColor = UIColor.white
        tipsLabel.frame = CGRect(x: 0, y: 67, width: 200, height: 20)
        tipsLabel.font = UIFont.systemFont(ofSize: 10)
        tipsLabel.textColor = UIColor(netHex: 0x989898)
        tipsLabel.text = "  Makoda红包"
        return tipsLabel
    }()
    
    private func _commonInit() {
        _tapGesture()

        addSubview(bgView)
        addSubview(imageView)
//        addSubview(nickNameLabel)
        addSubview(titleLabel)
        addSubview(tipsLabel)
//        addSubview(line)
    }
    
    func _tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(_clickCell))
        tap.numberOfTapsRequired = 1
        addGestureRecognizer(tap)
    }
    
    @objc func _clickCell() {
//        _delegate?.message?(message: _message, user: _user, businessCardName: _userName!, businessCardAppKey: _appKey!)
        
        let jsonText = _message.jmessage?.content as? JMSGTextContent
        
        _delegate?.message(isRecive: isRecive, message: _message, text: jsonText?.text ?? "")
    }

}
