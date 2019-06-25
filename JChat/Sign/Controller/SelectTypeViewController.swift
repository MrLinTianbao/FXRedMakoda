//
//  SelectTypeViewController.swift
//  KaMengApplication
//
//  Created by DUONIU_MAC on 2018/10/9.
//  Copyright © 2018年 DUONIU_MAC. All rights reserved.
//

import UIKit

class SelectTypeViewController: CTViewController {
    
    var textBlock : ((String)->Void)?
    var typeView : SelectTypeView!
    
    fileprivate var dataArray = [String]()
    fileprivate var selectText = ""
    
    init(dataArray:[String],selectText:String) {
        super.init(nibName: nil, bundle: nil)
        
        self.dataArray = dataArray
        self.selectText = selectText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createSubView()
    }
    
    //AMRK: 创建子视图
    fileprivate func createSubView() {
        
        typeView = SelectTypeView.init(dataArray: dataArray, text: selectText)
        typeView.closeBtn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        typeView.confirmBtn.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
        self.view.addSubview(typeView)
        
        typeView.snp.makeConstraints { (make) in
            
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(RATIO_H(maxNum: 250))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.dismiss(animated: false, completion: nil)
    }
    
    //MARK: 关闭
    @objc fileprivate func closeAction() {
        
        self.dismiss(animated: false, completion: nil)
    }
    
    //MARK: 确定
    @objc fileprivate func confirmAction() {
        
        self.textBlock!(typeView.selectText)
        self.dismiss(animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
