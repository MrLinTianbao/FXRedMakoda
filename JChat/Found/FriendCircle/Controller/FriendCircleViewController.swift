//
//  FriendCircleViewController.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/24.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit
import TZImagePickerController

class FriendCircleViewController: CTViewController {
    
    fileprivate let cellId = "friendCircleCell"
    
    fileprivate let dataArray = [3,8,9,5,3,6,5,4,2,1,7,6]
    
    fileprivate var commentArray = [["哈哈哈哈哈哈"],["哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈"],["哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈"],["哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈"],[String](),[String](),[String](),[String](),[String](),[String](),[String](),[String]()]
    
    fileprivate let titleArray = ["哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"]
    
    @IBOutlet weak var tableView: UITableView!
    
    var headView : FriendCircleHeadView?
    
    fileprivate var chatKeyBoard : ChatKeyBoard!
    
    var tag = 0 //记录点击按钮，1为更换banner，2为更换头像
    
    fileprivate var commentIndex = 0 //评论cell位置
    
    fileprivate var cellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setKeyboard()
        
        headView = Bundle.main.loadNibNamed("FriendCircleHeadView", owner: self, options: nil)?.last as? FriendCircleHeadView
        headView!.frame = .init(x: 0, y: 0, width: ScreenW, height: 220)
        
        headView?.backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        headView?.photoBtn.addTarget(self, action: #selector(selectPhoto(sender:)), for: .touchUpInside)
        headView?.avatarBtn.addTarget(self, action: #selector(selectPhoto(sender:)), for: .touchUpInside)
        
        let tapGestrue = UITapGestureRecognizer.init(target: self, action: #selector(selectBanner(sender:)))
        headView?.bannerImage.isUserInteractionEnabled = true
        headView?.bannerImage.addGestureRecognizer(tapGestrue)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableHeaderView = headView
        tableView.register(UINib.init(nibName: "FriendCircleCell", bundle: nil), forCellReuseIdentifier: cellId)
        
    }
    
    //MARK: 设置键盘
    fileprivate func setKeyboard() {
        
        chatKeyBoard = ChatKeyBoard.init(navgationBarTranslucent: false)
        
        chatKeyBoard.delegate = self
        chatKeyBoard.dataSource = self
        chatKeyBoard.placeHolder = "评论"
        chatKeyBoard.keyBoardStyle = .comment
        chatKeyBoard.allowMore = false
        chatKeyBoard.allowVoice = false
        chatKeyBoard.backgroundColor = UIColor.setRGB(0xF6F6F6)
//        chatKeyBoard.frame = .init(x: 0, y: ScreenH, width: ScreenW, height: 60)
//        chatKeyBoard.associateTableView = tableView
        
        self.view.addSubview(chatKeyBoard)
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }

    //MARK: 返回
    @objc fileprivate func backAction() {
        
        self.navigationController?.popViewController()
    }
    
    //MARK: 选择背景图片
    @objc fileprivate func selectBanner(sender:UITapGestureRecognizer) {
        
        self.tag = 3
        showPhotoView()
    }
    
    //MARK: 选择图片
    @objc fileprivate func selectPhoto(sender:UIButton) {
        
        tag = sender.tag
        showPhotoView()
        
    }
    
    //MARK: 显示图片页面
    fileprivate func showPhotoView() {
        
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
        
        if self.tag == 1 {
            let imagePickerVC = TZImagePickerController.init(maxImagesCount: 9, delegate: self)
            
            //通过block或代理得到用户选择的照片
            imagePickerVC?.didFinishPickingPhotosHandle = {(images,assets,flag) in
                
                
            }
            
            
            self.present(imagePickerVC!, animated: true, completion: nil)
        }else if self.tag == 2 {
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            let temp_mediaType = UIImagePickerController.availableMediaTypes(for: picker.sourceType)
            picker.mediaTypes = temp_mediaType!
            picker.allowsEditing = true
            picker.modalTransitionStyle = .coverVertical
            present(picker, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    
}

extension FriendCircleViewController : FriendCircleCellDelegate {
    
    
    func cellHeight(height: CGFloat, indexPath: IndexPath) {
        
    }
    
    
    //MARK: 评论
    func commentAction(index:Int) {
        
        commentIndex = index
        
        self.chatKeyBoard.keyboardUpforComment()
    }
}

extension FriendCircleViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate,TZImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let headImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        switch self.tag {
        case 1:
            break
        case 2:
            break

        case 3:
            headView?.bannerImage.image = headImage
            headView?.bannerImage.contentMode = .scaleToFill
            headView?.tipLabel.text = ""
        default:
            break
        }
        
        
        self.dismiss(animated: true, completion: nil)
    }
}

extension FriendCircleViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let title = titleArray[indexPath.row]
        
        var count = dataArray[indexPath.row]/3
        let count2 = dataArray[indexPath.row]%3
        
        if count2 != 0 {
           count += 1
        }
        
        let titleHeight = title.size(font: 14, width: ScreenW-80).height + 5
        
        let imageHeight = CGFloat(count) * (ScreenW-134)/3
        
        var h:CGFloat = 0 //评论区高度
        
        let array = commentArray[indexPath.row]
            
        for title in array {
            
            let height = title.size(font: 12, width: ScreenW-80).height
            
            h += height
        }
        
        
        
        
        let height = titleHeight + imageHeight + 100 + h
        
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? FriendCircleCell
        
        var count = dataArray[indexPath.row]/3
        let count2 = dataArray[indexPath.row]%3

        if count2 != 0 {
            count += 1
        }

        cell?.collectionView.snp.remakeConstraints({ (make) in
            make.top.equalTo((cell?.titleLabel.snp.bottom)!).offset(8)
            make.left.equalTo((cell?.titleLabel)!)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(CGFloat(count) * (ScreenW-134)/3 + 20)
        })
        
        cell?.delegate = self
        cell?.dataArray = commentArray[indexPath.row]
        cell?.imageCount = dataArray[indexPath.row]
        cell?.titleLabel.text = titleArray[indexPath.row]
        cell?.selectionStyle = .none
        cell?.commentBtn.tag = indexPath.row
        cell?.cellIndex = indexPath.row
//        self.cellIndex.
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        chatKeyBoard.keyboardDownForComment()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        chatKeyBoard.keyboardDownForComment()
    }
}

extension FriendCircleViewController : ChatKeyBoardDelegate,ChatKeyBoardDataSource,FacePanelDelegate {
    func chatKeyBoardMorePanelItems() -> [MoreItem]! {
        
        return [MoreItem]()
    }
    
    func chatKeyBoardToolbarItems() -> [ChatToolBarItem]! {
        
        let item = ChatToolBarItem.init(kind: BarItemKind.face, normal: "face", high: "face_HL", select: "keyboard")
//        let item2 = ChatToolBarItem.init(kind: BarItemKind.switchBar, normal: "switchDown", high: nil, select: nil)
//        let item3 = ChatToolBarItem.init(kind: BarItemKind.switchBar, normal: "voice", high: "voice_HL", select: "keyboard")
//        let item4 = ChatToolBarItem.init(kind: BarItemKind.switchBar, normal: "more_ios", high: "more_ios_HL", select: nil)
        
        return [item!]
    }
    
    func chatKeyBoardFacePanelSubjectItems() -> [FaceThemeModel]! {
        
        var subjectArray = [FaceThemeModel]()

        let sources = ["face"];

        for i in 0..<sources.count {

            let plistName = sources[i]

            let plistPath = Bundle.main.path(forResource: plistName, ofType: "plist")
            let faceDic = NSDictionary.init(contentsOfFile: plistPath!)

            let allkeys = faceDic?.allKeys

            let themeM = FaceThemeModel()
            themeM.themeStyle = FaceThemeStyle.customEmoji
            themeM.themeDecribe = "f\(i)"

            var modelsArr = [FaceModel]()

            for i in 0..<allkeys!.count {
                let name = allkeys?[i] as? String
                let fm = FaceModel()
                fm.faceTitle = name
                fm.faceIcon = faceDic?.object(forKey: name ?? "") as? String
                modelsArr.append(fm)
            }

            themeM.faceModels = modelsArr

            subjectArray.append(themeM)
        }

        return subjectArray

    }
    
    func chatKeyBoardSendText(_ text: String!) {
        
        commentArray[commentIndex].append(text)
        tableView.reloadData()
        
        chatKeyBoard.keyboardDownForComment()
    }
    
}


