//
//  ViewController.swift
//  XLCustomer
//
//  Created by longma on 2018/10/16.
//  Copyright © 2018年 XLH. All rights reserved.
//

import UIKit

class MinePrivacySet: CTViewController {
    let titleArray = [["加我为朋友时需要验证"],["通讯录黑名单"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLocalData()
        self.setUIAppearance()
    }
    
    func setLocalData(){
        
    }
    func setUIAppearance(){
        self.title = "隐私设置"
        self.view.addSubview(tbvData)
        tbvData.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
    }
    override func actionRightItemClick(){
        self.pushViewController(targetStr: "WalletRecordVC")

    }
    @objc func switchDidChange(_ sender: UISwitch){
        print(sender.isOn)
    }
    //MARK: **************************** 懒加载
    lazy var tbvData: UITableView = {
        
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.KTheme.scroll
        tableView.rowHeight = 56
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.separatorStyle = .none

        let cell = UINib.init(nibName: "MineSwitchTbvCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "MineSwitchTbvCell")
        
        let cell1 = UINib.init(nibName: "MineWalletTbvCell", bundle: nil)
        tableView.register(cell1, forCellReuseIdentifier: "MineWalletTbvCell")
        

        return tableView
    }()
    
   
}
extension MinePrivacySet: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = titleArray[section]
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell( withIdentifier: "MineWalletTbvCell", for: indexPath) as! MineWalletTbvCell
            cell.labTitle.text = titleArray[indexPath.section][indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell( withIdentifier: "MineSwitchTbvCell", for: indexPath) as! MineSwitchTbvCell
            cell.labTitle.text = titleArray[indexPath.section][indexPath.row]
            cell.switchFlag.addTarget(self, action: #selector(switchDidChange(_:)), for: .valueChanged)
            
            return cell
        }
        

    }
    /*分区头部部高度*/
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 8
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHead = UIView.init()
        sectionHead.backgroundColor = tableView.backgroundColor
        return sectionHead
    }
    /*分区尾部高度*/
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = titleArray[indexPath.section][indexPath.row]
        if title == "通讯录黑名单" {
            self.pushViewController(targetStr: "BlacklistVC")
        }

    }
    
}
