//
//  SelectTypeView.swift
//  KaMengApplication
//
//  Created by DUONIU_MAC on 2018/10/9.
//  Copyright © 2018年 DUONIU_MAC. All rights reserved.
//

import UIKit

class SelectTypeView: UIView {
    
    fileprivate var dataArray = [String]()
    var selectText = ""
    
    let closeBtn = UIButton()
    let confirmBtn = UIButton()
    
    let pickView = UIPickerView()

    init(dataArray:[String],text:String) {
        super.init(frame: .zero)
        
        self.dataArray = dataArray
        self.selectText = text
        
        self.backgroundColor = UIColor.white
        
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.setTitleColor(UIColor.black, for: .normal)
        closeBtn.titleLabel?.font = UIFont.systemFont(ofSize: RATIO(maxNum: 16))
        self.addSubview(closeBtn)
        
        confirmBtn.setTitle(global_confirm, for: .normal)
        confirmBtn.setTitleColor(UIColor.setRGB(0xE97C95), for: .normal)
        confirmBtn.titleLabel?.font = UIFont.systemFont(ofSize: RATIO(maxNum: 16))
        self.addSubview(confirmBtn)
        
        pickView.delegate = self
        pickView.dataSource = self
        self.addSubview(pickView)
        
        closeBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(RATIO(maxNum: 20))
            make.top.equalToSuperview().offset(RATIO_H(maxNum: 10))
            make.width.greaterThanOrEqualTo(10)
            make.height.equalTo(RATIO_H(maxNum: 20))
        }
        
        confirmBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(RATIO(maxNum: -20))
            make.top.equalTo(closeBtn)
            make.width.greaterThanOrEqualTo(10)
            make.height.equalTo(closeBtn)
        }
        
        pickView.snp.makeConstraints { (make) in
            make.top.equalTo(closeBtn.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(ScreenW/3)
            make.bottom.equalToSuperview().offset(RATIO_H(maxNum: -10))
        }
        
        if let index = dataArray.index(of: selectText) {
            pickView.selectRow(index, inComponent: 0, animated: true)
        }
        
        pickView.selectedRow(inComponent: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SelectTypeView : UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        return ScreenW/3
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return RATIO_H(maxNum: 40)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = UILabel.init(frame: .init(x: 0, y: 0, width: ScreenW/3, height: RATIO_H(maxNum: 100)))
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 11)
        label.text = dataArray[row]
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return dataArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectText = dataArray[row]
    }
}
