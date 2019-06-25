//
//  MJTbvColorHeadView.swift
//  XLCustomer
//
//  Created by longma on 2019/1/8.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit
protocol MineHomeHeadViewDelegate: class {
    func onHeadBtnClicked()
}
class MineHomeHeadView: UIView {
    weak var delegate:MineHomeHeadViewDelegate?

    @IBOutlet weak var labUserPhone: UILabel!
    @IBOutlet weak var labUserID: UILabel!
    @IBOutlet weak var labUserName: UILabel!
    @IBOutlet weak var imvIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imvIcon.contentMode = .scaleAspectFit
        
    }
    @IBAction func onHeadBtnClicked(_ sender: Any) {
        
        self.delegate?.onHeadBtnClicked()

    }
    
}
