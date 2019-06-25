//
//  MJLabelPadding.swift
//  XLCustomer
//
//  Created by longma on 2019/1/15.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MJUITextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUIAppearance()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setUIAppearance()
        
    }
    
    func setUIAppearance(){
       self.textColor = UIColor.KTheme.dark
       self.phColor = "placeholder"
       self.borderStyle = .none
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setUIAppearance()
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
}
