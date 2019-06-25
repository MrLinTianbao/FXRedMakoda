//
//  FriendCircleCell.swift
//  JChat
//
//  Created by DUONIU_MAC on 2019/6/24.
//  Copyright © 2019年 HXHG. All rights reserved.
//

import UIKit

protocol FriendCircleCellDelegate: class {
    func cellHeight(height:CGFloat,indexPath:IndexPath)
    func commentAction(index:Int) //评论
    func replyAction(cellIndex:Int,index:Int) //回复
}

class FriendCircleCell: UITableViewCell {
    
    fileprivate let cellId = "imageCell"
    
    fileprivate let cellId2 = "commentsCell"
    
    @IBOutlet weak var avatarBtn: UIButton!
    
    @IBOutlet weak var nameLabel: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: FriendCircleImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var commentBtn: UIButton!
    
    @IBOutlet weak var lineView: UIView!
    
    var cellIndex = 0 //cell索引
    
    var dataArray = [String]() {
        didSet{
            
            if dataArray.count == 0{
                tableView.backgroundColor = UIColor.clear
            }
            tableView.reloadData()
        }
    }
    
    
    weak var delegate : FriendCircleCellDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    var imageCount = 0 {
        
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avatarBtn)
            make.left.equalTo(avatarBtn.snp.right).offset(8)
            make.width.greaterThanOrEqualTo(10)
            make.height.equalTo(15)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.left.equalTo(nameLabel)
            make.right.equalToSuperview().offset(-16)
            make.height.greaterThanOrEqualTo(10)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(titleLabel)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
        
        commentBtn.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp.bottom).offset(8)
            make.right.equalTo(titleLabel)
            make.width.height.equalTo(20)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.right.equalTo(commentBtn.snp.left).offset(-8)
            make.left.equalTo(titleLabel)
            make.centerY.equalTo(commentBtn)
            make.height.equalTo(commentBtn)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(timeLabel.snp.bottom).offset(8)
            make.left.right.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.bounces = false
        collectionView.register(UINib.init(nibName: "FirendCircleImageCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 20
        tableView.register(UINib.init(nibName: "CommentsCell", bundle: nil), forCellReuseIdentifier: cellId2)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    //MARK: 评论
    @IBAction func commentAction(_ sender: UIButton) {
        
        self.delegate?.commentAction(index: sender.tag)
    }
    
}

extension FriendCircleCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? FirendCircleImageCell
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: (ScreenW-134)/3, height: (ScreenW-134)/3)
    }
}

extension FriendCircleCell : UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId2, for: indexPath) as? CommentsCell
        cell?.titleLabel.text = dataArray[indexPath.row]
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.delegate?.replyAction(cellIndex: cellIndex, index: indexPath.row)
        
    }
}
