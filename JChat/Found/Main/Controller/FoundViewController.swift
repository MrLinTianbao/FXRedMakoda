//
//  FoundViewController.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/23.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class FoundViewController: CTViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.KTheme.notice
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }

    //MAKR: 朋友圈
    @IBAction func FriendCircle(_ sender: UIButton) {
        
        let friendCircleVC = FriendCircleViewController()
        friendCircleVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(friendCircleVC, animated: true)
    }
    
    //MARK: 公告
    @IBAction func noticeAction(_ sender: UIButton) {
        
        let messageVC = MessageViewController()
        messageVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(messageVC, animated: true)
        
    }
    
}
