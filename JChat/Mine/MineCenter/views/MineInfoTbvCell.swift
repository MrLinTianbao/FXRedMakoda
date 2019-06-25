//
//  KSimpleTitleTbvCell.swift
//  XLCustomer
//
//  Created by longma on 2019/1/2.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MineInfoTbvCell: UITableViewCell {

    @IBOutlet weak var imvIconH: NSLayoutConstraint!
    @IBOutlet weak var imvIconW: NSLayoutConstraint!
    @IBOutlet weak var imvIcon: UIImageView!
    @IBOutlet weak var labTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imvIcon.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
