//
//  LanguageClass.swift
//  CityTube
//
//  Created by DUONIU_MAC on 2019/6/5.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import UIKit
import Localize_Swift

class LanguageClass: NSObject {

    //MARK: 获取当前语言
    static func languageMode() -> LanguageType {
        if let languageCode = CacheClass.stringForEnumKey(.language_code) {
            
            switch languageCode {
            case "zh-CN":
                return .cn
            case "zh-HK":
                return .hk
            case "en-US":
                return .en
            default:
                return .hk
            }
        }else {
            let preferredLanguage = Locale.preferredLanguages[0]
            if preferredLanguage.contains("zh-Hans") {
                return .cn
            }else if preferredLanguage.contains("zh-Hant") || preferredLanguage.contains("HK") || preferredLanguage.contains("TW") || preferredLanguage.contains("MO"){
                return .hk
            }else {
                return .en
            }
        }
        
    }
    
    //MARK: 修改语言
    static func changeLanguage() {
        switch self.languageMode() {
        case .cn:
            Localize.setCurrentLanguage("zh-Hans")
        case .hk:
            Localize.setCurrentLanguage("zh-Hant")
        case .en:
            Localize.setCurrentLanguage("en")
        }
    }
}
