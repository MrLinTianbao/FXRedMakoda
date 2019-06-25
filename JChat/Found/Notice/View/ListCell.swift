//
//  ListCell.swift
//  TestDemo
//
//  Created by DUONIU_MAC on 2019/5/16.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    var model : MessageModel! {
        didSet{
            updateData()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! //标题
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: 更新数据
    fileprivate func updateData() {
        
        titleLabel.text = model.title
    }
    
}
