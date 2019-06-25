//
//  JCMessage.swift
//  JChat
//
//  Created by JIGUANG on 10/04/2017.
//  Copyright © 2017 HXHG. All rights reserved.
//

import UIKit
import JMessage

open class JCMessage: NSObject, JCMessageType {
    

    init(content: JCMessageContentType) {
        self.content = content
        self.options = JCMessageOptions(with: content)
        super.init()
    }
    
    public let identifier: UUID = .init()
    open var msgId = ""
    open var name: String = "UserName"
    open var date: Date = .init()
    open var sender: JMSGUser?
    open var senderAvator: UIImage?
    open var receiver: JMSGUser?
    open var content: JCMessageContentType
    public let options: JCMessageOptions
    open var updateSizeIfNeeded: Bool = false
    open var unreadCount: Int = 0
    open var targetType: MessageTargetType = .single
    open var contentType: JMSGContentType = .text
    open var jmessage: JMSGMessage?
}

extension JMSGMessage {
    typealias Callback = (JMSGMessage, Data?) -> Void
    func parseMessage(_ delegate: JCMessageDelegate, _ updateMediaMessage: Callback? = nil) -> JCMessage {
        var msg: JCMessage!
        let currentUser = JMSGUser.myInfo()
        let isCurrent = fromUser.isEqual(to: currentUser)
        let state = self.ex.state

        switch(contentType) {
        case .text:
            if ex.isBusinessCard {
                let businessCardContent = JCBusinessCardContent()
                businessCardContent.delegate = delegate
                businessCardContent.appKey = ex.businessCardAppKey
                businessCardContent.userName = ex.businessCardName
                msg = JCMessage(content: businessCardContent)
            }else {
                
                let content = self.content as! JMSGTextContent
                
                let text = content.text
                let jsonData:Data = text.data(using: .utf8)!
                let dic = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
                if let dict = dic as? [String:Any] {
                    if let type = dict["type"] as? String {
                        if type == "hb" {
                            let businessCardContent = JCRedContent()
                            businessCardContent.delegate = delegate
                            businessCardContent.redDelegate = delegate as? JCRedMessageDelegate 
                            businessCardContent.appKey = ""
                            businessCardContent.userName = ""
                            
                            if let hb_infor = dict["hb_infor"] as? [String:Any] {
                                businessCardContent.amount = hb_infor["hb_money"] as? String
                                businessCardContent.count = hb_infor["hb_num"] as? String
                                businessCardContent.noteText = hb_infor["hb_extra"] as? String
                                
                            }
                            
                            msg = JCMessage(content: businessCardContent)
                        }
                    }
                }else{
                    msg = JCMessage(content: JCMessageTextContent(text: content.text))
                }
            }
                
        case .image:
            let content = self.content as! JMSGImageContent
            
            let text = content.toJsonString()
            
            if text.contains("Picture_Reference") {
                let jsonData:Data = text.data(using: .utf8)!
                let dic = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
                
                if let dict = dic as? [String:Any] {
                    
                    if let dict2 = dict["extras"] as? [String:Any] {
                        if let jsonStr = dict2["imageExtend"] as? String {
                            let jsonData2:Data = jsonStr.data(using: .utf8)!
                            let dic2 = try? JSONSerialization.jsonObject(with: jsonData2, options: .mutableContainers)
                            if let dict2 = dic2 as? [String:Any] {
                                let textImageContent = JCTextImageContent()
                                if let Picture_Reference = dict2["Picture_Reference"] as? [String:Any] {
                                    textImageContent.delegate = delegate
                                    textImageContent.userName = Picture_Reference["Citer"] as? String
                                    textImageContent.sendText = Picture_Reference["Respondents"] as? String
                                }
                                
                                msg = JCMessage(content: textImageContent)
                                
                                if let path = content.thumbImageLocalPath {
                                    let image = UIImage(contentsOfFile: path)
                                    textImageContent.image = image
                                    msg.content = textImageContent
                                } else {
                                    content.thumbImageData({ (data, id, error) in
                                        if let data = data {
                                            textImageContent.image = UIImage.init(data: data)                                    }
                                    })
                                }
                                
                                
                                
                                
                            }
                        }
                    }
                    
                }
            }else{
                let imageContent = JCMessageImageContent()
                imageContent.imageSize = content.imageSize
                if ex.isLargeEmoticon {
                    imageContent.imageSize = CGSize(width: content.imageSize.width / 3, height: content.imageSize.height / 3)
                }
                if state == .sending {
                    content.uploadHandler = {  (percent:Float, msgId:(String?)) -> Void in
                        imageContent.upload?(percent)
                    }
                }
                imageContent.delegate = delegate
                msg = JCMessage(content: imageContent)
                
                if let path = content.thumbImageLocalPath {
                    let image = UIImage(contentsOfFile: path)
                    imageContent.image = image
                    msg.content = imageContent
                } else {
                    content.thumbImageData({ (data, id, error) in
                        if let data = data {
                            if let updateMediaMessage = updateMediaMessage {
                                updateMediaMessage(self, data)
                            }
                        }
                    })
                }
            }
            
            
        case .eventNotification:
            let content = self.content as! JMSGEventContent
            let noticeContent = JCMessageNoticeContent(text: content.showEventNotification())
            msg = JCMessage(content: noticeContent)
            msg.options.showsTips = false
        case .voice:
            let content = self.content as! JMSGVoiceContent
            let voiceContent = JCMessageVoiceContent()
            voiceContent.duration = TimeInterval(content.duration.intValue)
            voiceContent.delegate = delegate
            msg = JCMessage(content: voiceContent)
            content.voiceData({ (data, id, error) in
                if let data = data {
                    voiceContent.data = data
                }
            })
        case .video:
            printLog("video message")
            let content = self.content as! JMSGVideoContent
            let videoContent = JCMessageVideoContent()
            videoContent.delegate = delegate
            msg = JCMessage(content: videoContent)
            
            if state == .sending {
                content.uploadHandler = {  (percent:Float, msgId:(String?)) -> Void in
                    videoContent.uploadVideo?(percent)
                }
            }
            
            if let path = content.videoThumbImageLocalPath {
                let url = URL(fileURLWithPath: path)
                let thumbData = try! Data(contentsOf: url)
                videoContent.image = UIImage(data: thumbData)
            }else{
                content.videoThumbImageData { (data, id, error) in
                    if let data = data {
                        if let updateMediaMessage = updateMediaMessage {
                            updateMediaMessage(self, data)
                        }
                    }
                }
            }
            videoContent.videoContent = content;
        case .file:
            printLog("file message")
            let content = self.content as! JMSGFileContent
            if ex.isShortVideo {
                let videoContent = JCMessageVideoContent()
                videoContent.delegate = delegate
                videoContent.videoFileContent = content;
                msg = JCMessage(content: videoContent)
            } else {
                let fileContent = JCMessageFileContent()
                fileContent.delegate = delegate
                fileContent.fileName = content.fileName
                fileContent.fileType = ex.fileType
                fileContent.fileSize = ex.fileSize
                if let path = content.originMediaLocalPath {
                    let url = URL(fileURLWithPath: path)
                    fileContent.data = try! Data(contentsOf: url)
                }
                msg = JCMessage(content: fileContent)
            }
        case .location:
            let content = self.content as! JMSGLocationContent
            let locationContent = JCMessageLocationContent()
            locationContent.address = content.address
            locationContent.lat = content.latitude.doubleValue
            locationContent.lon = content.longitude.doubleValue
            locationContent.delegate = delegate
            msg = JCMessage(content: locationContent)
        case .prompt:
            let content = self.content as! JMSGPromptContent
            let noticeContent = JCMessageNoticeContent(text: content.promptText)
            msg = JCMessage(content: noticeContent)
            msg.options.showsTips = false
        default:
            msg = JCMessage(content: JCMessageNoticeContent.unsupport)
        }
        if msg.options.alignment != .center {
            msg.options.alignment = isCurrent ? .right : .left
            if self.targetType == .group {
                msg.options.showsCard = !isCurrent
            }
        }
        msg.targetType = MessageTargetType(rawValue: self.targetType.rawValue)!
        msg.msgId = self.msgId
        msg.options.state = state
        if isCurrent {
            msg.senderAvator = UIImage.getMyAvator()
        }
        msg.sender = fromUser
        msg.name = fromUser.displayName()
        msg.unreadCount = getUnreadCount()
        msg.contentType = contentType
        msg.jmessage = self
        return msg
    }
}

