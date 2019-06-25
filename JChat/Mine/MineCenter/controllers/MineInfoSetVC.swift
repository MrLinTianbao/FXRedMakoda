//
//  ViewController.swift
//  XLCustomer
//
//  Created by longma on 2018/10/16.
//  Copyright © 2018年 XLH. All rights reserved.
//

import UIKit

class MineInfoSetVC: CTViewController {
    let dataArray = ["头像","昵称","ID","我的二维码","手机"]
    var headCell:MineInfoTbvCell?
    var nameCell:MineInfoTitleTbvCell?
    var idCell:DistributionRecordTbvCell?
    var codeCell:MineInfoTbvCell?
    var phoneCell:DistributionRecordTbvCell?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLocalData()
        self.setUIAppearance()
    }
    
    func setLocalData(){
        
    }
    func setUIAppearance(){
        self.title = "个人资料"
        self.view.addSubview(tbvData)
        tbvData.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
    }
    //MARK: 相机
    fileprivate lazy var imagePicker: UIImagePickerController = {
        var picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()
    
    //MARK: 从相册选择
    fileprivate func selectFromAlbum() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        let temp_mediaType = UIImagePickerController.availableMediaTypes(for: picker.sourceType)
        picker.mediaTypes = temp_mediaType!
        picker.allowsEditing = true
        picker.modalTransitionStyle = .coverVertical
        present(picker, animated: true, completion: nil)
    }
    //MARK: **************************** 懒加载
    lazy var tbvData: UITableView = {
        
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.KTheme.scroll
        tableView.rowHeight = 63
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 0)
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
      
        
        return tableView
    }()
    
    
}
extension MineInfoSetVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let headImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        headCell?.imvIcon.image = headImage

        self.dismiss(animated: true, completion: nil)
    }
}
extension MineInfoSetVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var simCell = UITableViewCell()
        if indexPath.section == 0 && indexPath.row == 0 {
            if headCell == nil{
                headCell = (Bundle.main.loadNibNamed("MineInfoTbvCell", owner: self, options: nil)?.last as! MineInfoTbvCell)
            }
            headCell?.labTitle.text = dataArray[indexPath.row]
            headCell?.labTitle.font = UIFont.systemFont(ofSize: 16)
            headCell?.imvIconW.constant = 60
            headCell?.imvIconH.constant = 60
            headCell?.imvIcon.image = UIImage.init(named: "矩形r")
            
            simCell = headCell!
        }
        if indexPath.section == 0 && indexPath.row == 1 {
            if nameCell == nil{
                nameCell = (Bundle.main.loadNibNamed("MineInfoTitleTbvCell", owner: self, options: nil)?.last as! MineInfoTitleTbvCell)
                nameCell?.labTitle.text = dataArray[indexPath.row]
                nameCell?.labSubTitle.text = "娃哈哈"
            }
            simCell = nameCell!
        }
        if indexPath.section == 0 && indexPath.row == 2 {
            if idCell == nil{
                idCell = (Bundle.main.loadNibNamed("DistributionRecordTbvCell", owner: self, options: nil)?.last as! DistributionRecordTbvCell)
                idCell?.labSubTitle.textColor = UIColor.KTheme.shallowGray
                idCell?.labTitle.text = dataArray[indexPath.row]
                idCell?.labSubTitle.text = "123456789"
            }
            simCell = idCell!
        }
        if indexPath.section == 0 && indexPath.row == 3 {
            if codeCell == nil{
                codeCell = (Bundle.main.loadNibNamed("MineInfoTbvCell", owner: self, options: nil)?.last as! MineInfoTbvCell)
            }
            codeCell?.labTitle.text = dataArray[indexPath.row]
            simCell = codeCell!
        }
        if indexPath.section == 0 && indexPath.row == 4 {
            if phoneCell == nil{
                phoneCell = (Bundle.main.loadNibNamed("DistributionRecordTbvCell", owner: self, options: nil)?.last as! DistributionRecordTbvCell)
                phoneCell?.labTitle.text = dataArray[indexPath.row]
                phoneCell?.labSubTitle.textColor = UIColor.KTheme.shallowGray
                phoneCell?.labSubTitle.text = "+60 1341234678"

            }
            simCell = phoneCell!
        }
        return simCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 108
        }else{
            return 56
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 1 {
            self.pushViewController(targetStr: "ChangeUserNameVC")
        }
        if indexPath.row == 3 {
            self.pushViewController(targetStr: "UserQRCodeVC")
        }
        if indexPath.row == 0 {
            
            let selectPhotoVC = SelectPhotoViewController()
            selectPhotoVC.modalPresentationStyle = .overCurrentContext
            selectPhotoVC.photoBlock = {(title) in
                
                if title == "从手机相册选择" {
                    
                    self.selectFromAlbum()
                    
                }else if title == "拍摄" {
                    
                    self.present(self.imagePicker, animated: true, completion: nil)
                }
                
            }
            self.present(selectPhotoVC, animated: false, completion: nil)
            
        }
        
        
        
    }
    
}
