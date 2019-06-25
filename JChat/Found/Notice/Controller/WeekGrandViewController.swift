//
//  WeekGrandViewController.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/23.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class WeekGrandViewController: CTViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let listView = ListView.init(frame: .zero)
        self.view.addSubview(listView)
        self.view.backgroundColor = UIColor.setRGB(0xF2F2F2)
        
        listView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets.zero)
        }
        
        listView.selectBlock = {
            
            self.navigationController?.pushViewController(NoticeDetailsViewController())
        }
    }
    

    


}
