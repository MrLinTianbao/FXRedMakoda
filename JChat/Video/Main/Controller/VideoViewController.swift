//
//  VideoViewController.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/23.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class VideoViewController: CTViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubView()
    }

    //MARK: 添加子视图
    fileprivate func addSubView() {
        
        self.view.backgroundColor = UIColor.KTheme.notice
        
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "lookforward")
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        
        let titleLabel = UILabel()
        titleLabel.text = "敬请期待"
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        self.view.addSubview(titleLabel)
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(86)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(RATIO_H(300))
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom)
            make.centerX.equalTo(imageView)
            make.width.greaterThanOrEqualTo(10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    

}
