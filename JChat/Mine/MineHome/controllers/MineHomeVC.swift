//
//  ViewController.swift
//  XLCustomer
//
//  Created by longma on 2018/10/16.
//  Copyright © 2018年 XLH. All rights reserved.
//

import UIKit

class MineHomeVC: CTViewController {
    let titleArray = [["钱包","快速充值"],["扫一扫","我的朋友圈"],["分销","群规"],["设置"]]
    var targetArray = [["MineWalletVC","MineHomeVC"],["MineHomeVC","MineHomeVC"],["DistributionShareVC","MineHomeVC"],["MineSetListVC"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLocalData()
        self.setUIAppearance()
    }
    
    func setLocalData(){
        
    }
    func setUIAppearance(){
        self.title = "我的"
        self.view.addSubview(tbvData)
        tbvData.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
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
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 0)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)

        let cell = UINib.init(nibName: "MineHomeTbvCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "MineHomeTbvCell")
        
        tableView.tableHeaderView = tbvHeadView

        return tableView
    }()
    lazy var tbvHeadView: MineHomeHeadView = {
        let tableHeadView = Bundle.main.loadNibNamed("MineHomeHeadView", owner: self, options: nil)?.last as! MineHomeHeadView
        tableHeadView.frame = CGRect(x: 0, y: 0, width: ScreenW, height: 110)
        tableHeadView.autoresizingMask = UIView.AutoresizingMask(rawValue: 0)
        tableHeadView.delegate = self
        return tableHeadView
    }()
   
}
extension MineHomeVC: MineHomeHeadViewDelegate  {
    
    func onHeadBtnClicked() {
        self.pushViewController(targetStr: "MineInfoSetVC")

    }
}
extension MineHomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = titleArray[section]
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell( withIdentifier: "MineHomeTbvCell", for: indexPath) as! MineHomeTbvCell
        cell.labTitle.text = titleArray[indexPath.section][indexPath.row]
        cell.imvIcon.image = UIImage.init(named: titleArray[indexPath.section][indexPath.row])

        return cell
    }
    /*分区头部部高度*/
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
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

        let tag = targetArray[indexPath.section][indexPath.row]
        if  tag != "MineHomeVC" {
            self.pushViewController(targetStr: tag)
        }

    }
    
}
