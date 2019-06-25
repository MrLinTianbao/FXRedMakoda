//
//  FriendCircleLayout.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/24.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class FriendCircleLayout: UICollectionViewFlowLayout {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 10
        
    }

    
}
