//
//  HBDanTangViewController.swift
//  DanTang
//
//  Created by 贺兵 on 2017/5/10.
//  Copyright © 2017年 贺兵. All rights reserved.
//

import UIKit

class HBDanTangViewController: HBBaseViewController {
    
    
    func requestTopTitleData() {
        
        HBNetWorkTools.networktools.loadTopTitleInfo { (chanels:[HBChanelModel]) in
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.requestTopTitleData()
        self.addChildViewControllers()
    }
    
    func addChildViewControllers() {
        

    }
    
    func setupTitleViews() {
        
        let bgView = UIView()
        bgView.frame = CGRect.init(x: 0.0, y: PNavBarHeight, width: SCREEN_WIDTH, height: KTitleViewHeight)
        self.view.addSubview(bgView)
        
        
        
    }
}
