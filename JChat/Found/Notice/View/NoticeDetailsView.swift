//
//  NoticeDetailsView.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/23.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

class NoticeDetailsView: UIView {
    
    fileprivate let cellId = "noticeDetailsCell"
    
    fileprivate var notDataView : UIImageView!
    
    fileprivate var tableView : UITableView!

    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = UIColor.KTheme.notice
        
        let headView = Bundle.main.loadNibNamed("NoticeDetailsHeadView", owner: self, options: nil)?.last as? NoticeDetailsHeadView
        headView?.frame = .init(x: 0, y: 0, width: ScreenW, height: 50)
        self.addSubview(headView!)
        
        tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(UINib.init(nibName: "NoticeDetailsCellTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        self.addSubview(tableView)
        
        notDataView = UIImageView.init(frame: .init(x: ScreenW/4, y: ScreenH/4, width: ScreenW/2, height: ScreenH/2))
        notDataView.backgroundColor = UIColor.white
        notDataView.image = UIImage.init(named: "notData")
        notDataView.contentMode = .scaleAspectFit
        notDataView.isHidden = true
        tableView.addSubview(notDataView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(headView!.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NoticeDetailsView : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? NoticeDetailsCellTableViewCell
        cell?.selectionStyle = .none
        cell?.numberLabel.text = "\(indexPath.row+1)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
}
