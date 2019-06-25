//
//  ViewController.swift
//  XLCustomer
//
//  Created by longma on 2018/10/16.
//  Copyright © 2018年 XLH. All rights reserved.
//

import UIKit

class TransferAccountsVC: CTViewController {
    var dataArray = ["xxxx"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLocalData()
        self.setUIAppearance()
    }
    
    func setLocalData(){
        
    }
    func setUIAppearance(){
        self.view.addSubview(btnConfrim)
        self.view.addSubview(clvData)

        self.view.backgroundColor = UIColor.KTheme.scroll
        btnConfrim.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view).offset(-26)
            make.left.equalTo(self.view).offset(30)
            make.right.equalTo(self.view).offset(-30)
            make.height.equalTo(50)
        }

        clvData.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view)
            make.bottom.equalTo(btnConfrim.snp.top)
        }
        
        self.title = "转账充值"
        
    }
    
    //MARK: **************************** 懒加载
    lazy var btnConfrim: MJButton = {
        
        let button = MJButton ()
        button.setTitle("确定", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
      
        button.addTarget(self, action: #selector(clickBtn1), for: .touchUpInside)
        
        return button
    }()
    
    @objc func clickBtn1(_ sender:UIButton){
    }
    lazy var clvData: UICollectionView = {
        let space:CGFloat = 15.0
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = space //列与列之间的间距
        layout.minimumLineSpacing = space //行与行之间的间距
        let width = (ScreenW - space*4)/3
        layout.itemSize = CGSize.init(width: width, height: width)
        
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.KTheme.scroll
        collectionView.delegate = self;
        collectionView.dataSource = self;
        let cell = UINib.init(nibName: "KSampleClvCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "KSampleClvCell")
        
        let secionHead = UINib.init(nibName: "TransferAccountsHeadView", bundle: nil)
        collectionView.register(secionHead, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TransferAccountsHeadView")

        //420
        
        return collectionView
    }()

}
extension TransferAccountsVC: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KSampleClvCell", for: indexPath) as! KSampleClvCell
        cell.imvIcon.image = UIImage.init(named: "上传截图按钮")
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        var v = UICollectionReusableView()
        if kind == UICollectionView.elementKindSectionHeader
        {
            v = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TransferAccountsHeadView", for: indexPath)as! TransferAccountsHeadView
        }
        
        return v
    }
    /* sectionHeadView 尺寸*/
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        
        return CGSize(width: ScreenW, height: 420)
    }
}
