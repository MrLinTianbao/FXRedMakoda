//
//  NoticeDetailsViewController.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/23.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class NoticeDetailsViewController: CTViewController {
    
    fileprivate let titleLabel = UILabel()
    
    fileprivate let selectVC = SelectViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "公告详情"
        addSubView()
    }

    //MARK: 添加子视图
    fileprivate func addSubView() {
        
        self.view.backgroundColor = UIColor.KTheme.notice
        
        titleLabel.text = "2019年6月23日战报详情"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(titleLabel)
        
        selectVC.titles = ["发包最多","点包最多"]
        selectVC.controllers = [SendPackageViewController(),TouchPackageViewController()]
        self.addChild(selectVC)
        self.view.addSubview(selectVC.view)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualTo(10)
            make.height.greaterThanOrEqualTo(10)
        }
        
        selectVC.view.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
    }
    

}
