//
//  SelectViewController.swift
//  TestDemo
//
//  Created by DUONIU_MAC on 2019/5/16.
//  Copyright © 2019年 DUONIU_MAC. All rights reserved.
//

import UIKit


class SelectViewController: CTViewController {
    
    fileprivate let ScreenW = UIScreen.main.bounds.width //屏幕宽度
    
    fileprivate let ScreenH = UIScreen.main.bounds.height //屏幕高度
    
    var titles = [String]() //标题数组
    
    var controllers : [UIViewController]! { //控制器数组
     
        didSet{
            addSubView()
        }
    }
    
    fileprivate let scrollView = UIScrollView()
    
    fileprivate let leftButton = UIButton() //左按钮
    
    fileprivate let rightButton = UIButton() //右按钮
    
    fileprivate let selectView = UIView() //滚动条
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: 添加子视图
    fileprivate func addSubView() {
        
        leftButton.frame = .init(x: 0, y: 0, width: ScreenW/2, height: 50)
        leftButton.tag = 1
        leftButton.backgroundColor = UIColor.KTheme.notice
        leftButton.setTitle(titles[0], for: .normal)
        leftButton.setTitleColor(UIColor.KTheme.deepOrange, for: .normal)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        leftButton.addTarget(self, action: #selector(selectButton(sender:)), for: .touchUpInside)
        self.view.addSubview(leftButton)
        
        rightButton.frame = .init(x: ScreenW/2, y: 0, width: ScreenW/2, height: 50)
        rightButton.tag = 2
        rightButton.backgroundColor = UIColor.KTheme.notice
        rightButton.setTitle(titles[1], for: .normal)
        rightButton.setTitleColor(UIColor.KTheme.placeholder, for: .normal)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightButton.addTarget(self, action: #selector(selectButton(sender:)), for: .touchUpInside)
        self.view.addSubview(rightButton)
        
        selectView.frame = .init(x: 0, y: leftButton.frame.maxY-2, width: ScreenW/2, height: 2)
        selectView.backgroundColor = UIColor.KTheme.deepOrange
        self.view.addSubview(selectView)
        
        scrollView.bounces = false
        scrollView.backgroundColor = UIColor.KTheme.notice
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = .init(width: ScreenW * 2, height: 0)
        self.view.addSubview(scrollView)
        
        let leftVC = controllers[0]
        self.addChild(leftVC)
        self.didMove(toParent: self)
        scrollView.addSubview(leftVC.view)
        
        let rightVC = controllers[1]
        self.addChild(rightVC)
        self.didMove(toParent: self)
        scrollView.addSubview(rightVC.view)
        
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(selectView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        leftVC.view.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        
        rightVC.view.snp.makeConstraints { (make) in
            make.left.equalTo(leftVC.view.snp.right)
            make.top.equalToSuperview()
            make.width.height.equalTo(leftVC.view)
        }
    }
    

    //MARK: 选择按钮
    @objc fileprivate func selectButton(sender:UIButton) {
        
        switch sender.tag {
        case 1:
            rightButton.setTitleColor(UIColor.KTheme.placeholder, for: .normal)
            leftButton.setTitleColor(UIColor.KTheme.deepOrange, for: .normal)
            
            UIView.animate(withDuration: 0.2) {
                
                self.selectView.center.x = self.leftButton.center.x
                
                self.scrollView.contentOffset.x = 0
                
            }
        case 2:
            leftButton.setTitleColor(UIColor.KTheme.placeholder, for: .normal)
            rightButton.setTitleColor(UIColor.red, for: .normal)
            
            UIView.animate(withDuration: 0.2) {
                
                self.selectView.center.x = self.rightButton.center.x
                
                self.scrollView.contentOffset.x = self.ScreenW
                
            }
        default:
            break
        }
    }

}

extension SelectViewController : UIScrollViewDelegate {
    
    //MARK: scrollView偏移量
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x == ScreenW {
            
            leftButton.setTitleColor(UIColor.KTheme.placeholder, for: .normal)
            rightButton.setTitleColor(UIColor.KTheme.deepOrange, for: .normal)
            selectView.center.x = rightButton.center.x
            
        }else if scrollView.contentOffset.x == 0 {
            leftButton.setTitleColor( UIColor.KTheme.deepOrange, for: .normal)
            rightButton.setTitleColor(UIColor.KTheme.placeholder, for: .normal)
            selectView.center.x = leftButton.center.x
        }
        
        selectView.frame.origin.x = scrollView.contentOffset.x/2
        
        if selectView.center.x > ScreenW/2 {
            leftButton.setTitleColor(UIColor.KTheme.placeholder, for: .normal)
            rightButton.setTitleColor( UIColor.KTheme.deepOrange, for: .normal)
        }else{
            leftButton.setTitleColor( UIColor.KTheme.deepOrange, for: .normal)
            rightButton.setTitleColor(UIColor.KTheme.placeholder, for: .normal)
        }
    }
}
