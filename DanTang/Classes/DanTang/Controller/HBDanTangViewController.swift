//
//  HBDanTangViewController.swift
//  DanTang
//
//  Created by 贺兵 on 2017/5/10.
//  Copyright © 2017年 贺兵. All rights reserved.
//

import UIKit

class HBDanTangViewController: HBBaseViewController {
    
    var titlesView = UIView()
    
    var contentScr:UIScrollView?
    
    var buttonArray = [UIButton]()
    
    func requestTopTitleData() {
        weak var weakSelf = self
        HBNetWorkTools.networktools.loadTopTitleInfo { (chanels:[HBChanelModel]) in
            
            weakSelf!.addChildViewControllers(channels: chanels)
            weakSelf?.setupTitleViews()
            weakSelf?.setupContentScr()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.requestTopTitleData()
        
    }
    
    func addChildViewControllers(channels:[HBChanelModel]) {
        
        for channel in channels {
            
            let VC = HBTopTypeViewController()
            VC.title = channel.name
            VC.type = channel.id!
            self.addChildViewController(VC)
        }
    }
    
    func setupTitleViews() {
        
        let bgView = UIView()
        bgView.frame = CGRect.init(x: 0.0, y: PNavBarHeight, width: SCREEN_WIDTH, height: KTitleViewHeight)
        self.view.addSubview(bgView)
        
        // 标签
        let titlesView = UIView()
        titlesView.backgroundColor = HBGlobalColor()
        titlesView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH - KTitleViewHeight, height: KTitleViewHeight)
        bgView.addSubview(titlesView)
        self.titlesView = titlesView
        
        // 选择按钮
        let arrowButton = UIButton()
        arrowButton.frame = CGRect(x: SCREEN_WIDTH - KTitleViewHeight, y: 0, width: KTitleViewHeight, height: KTitleViewHeight)
        arrowButton.setImage(UIImage(named: "arrow_index_down_8x4_"), for: .normal)
        arrowButton.addTarget(self, action: #selector(arrowButtonClick), for: .touchUpInside)
        arrowButton.backgroundColor = HBGlobalColor()
        bgView.addSubview(arrowButton)
        
        let count = self.childViewControllers.count
        let buttonWidth = titlesView.frame.size.width/CGFloat.init(count)
        let bottonHeight = KTitleViewHeight
        
        for i in 0..<self.childViewControllers.count {
            
            let titleButton = UIButton()
            titleButton.frame = CGRect.init(x: 0 + buttonWidth * CGFloat.init(i), y: 0, width: buttonWidth, height: bottonHeight)
            let vc = self.childViewControllers[i]
            titleButton.setTitle(vc.title, for: .normal)
            titleButton.setTitleColor(UIColor.gray, for: .normal)
            titleButton.setTitleColor(HBGlobalRedColor(), for: .disabled)
            titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            titleButton.addTarget(self, action: #selector(titlesAction), for: .touchUpInside)
            if i == 0 {
                
                titleButton.isEnabled = false
            }
            titleButton.tag = i
            titlesView.addSubview(titleButton)
            buttonArray.append(titleButton)
        }
        
    }
    
    func setupContentScr() {
        
        automaticallyAdjustsScrollViewInsets = false
        contentScr = UIScrollView.init(frame: self.view.bounds)
        contentScr?.delegate = self
        contentScr?.contentSize = CGSize.init(width: (contentScr?.width)! * CGFloat.init(self.childViewControllers.count), height: (contentScr?.height)!)
        contentScr?.isPagingEnabled = true
        self.view.insertSubview(contentScr!, at: 0)
        self.scrollViewDidEndScrollingAnimation(contentScr!)
    }
    
    func arrowButtonClick(sender:UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            
            //sender.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            sender.imageView?.transform = sender.imageView!.transform.rotated(by: CGFloat(M_PI))
        }
    }
    
    func titlesAction(sender:UIButton) {
        
        for button in buttonArray {
            
            button.isEnabled = true
        }
        sender.isEnabled = false
        
        contentScr?.setContentOffset(CGPoint.init(x: CGFloat.init(sender.tag) * SCREEN_WIDTH, y: 0), animated: true)
        
    }
}
extension HBDanTangViewController:UIScrollViewDelegate {
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        // 添加子控制器的 view
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 取出子控制器
        let vc = childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0 // 设置控制器的y值为0(默认为20)
        //设置控制器的view的height值为整个屏幕的高度（默认是比屏幕少20）
        vc.view.height = scrollView.height
        scrollView.addSubview(vc.view)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 点击 Button
        let button = buttonArray[index]
        titlesAction(sender: button)
    }
    
}
