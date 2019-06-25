//
//  MJLabelPadding.swift
//  XLCustomer
//
//  Created by longma on 2019/1/15.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MJButton: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUIAppearance()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setUIAppearance()

    }
    
    func setUIAppearance(){
        self.isClickEnabled = false
        self.setCornerRadius(10)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setUIAppearance()
     

    }
    var isClickEnabled : Bool!{
        
        didSet{
            self.isEnabled = isClickEnabled

            if isClickEnabled {
                self.backgroundColor = UIColor.KTheme.deepOrange
            }else{
               self.backgroundColor = UIColor.KTheme.shallowOrange
            }
            
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()

    }
   
    
}
