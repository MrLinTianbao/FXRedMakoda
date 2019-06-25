//
//  MessageViewController.swift
//  JChat
//
//  Created by JZY_DEV on 2019/5/14.
//  Copyright © 2019 HXHG. All rights reserved.
//

import UIKit



class MessageViewController: SelectViewController{

  
    
    
    override func viewDidLoad() {
       
        
        
        
        super.viewDidLoad()
        self.title = "公告"
        self.titles = ["每日战报","每周战报"]
        self.controllers = [DayGrandViewController(),WeekGrandViewController()]
    }
    
   
}
   
