//
//  HBNavigationController.swift
//  DanTang
//
//  Created by 贺兵 on 2017/5/10.
//  Copyright © 2017年 贺兵. All rights reserved.
//

import UIKit

class HBNavigationController: UINavigationController {

    
    internal override class func initialize() {
        
        super.initialize()
        
        /// 设置导航栏标题
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = HBGlobalRedColor()
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationBackClick))
        }
        super.pushViewController(viewController, animated: animated)
        
    }
    
    func navigationBackClick() {
        
        self.popViewController(animated: true)
    }
}
