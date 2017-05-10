//
//  HBTabBarController.swift
//  DanTang
//
//  Created by 贺兵 on 2017/5/10.
//  Copyright © 2017年 贺兵. All rights reserved.
//

import UIKit

class HBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBar = UITabBar.appearance()
        tabBar.tintColor = HBRGBA(r: 245, g: 90, b: 93, a: 1/0)
        self.addChildViewControllers()
        
    }
    
    private func addChildViewControllers() {
        
        self.addChildViewController(viewController: HBDanTangViewController(), title: "单糖", imageName: "TabBar_home_23x23_")
        self.addChildViewController(viewController: HBProductViewController(), title: "单品", imageName: "TabBar_gift_23x23_")
        self.addChildViewController(viewController: HBCategoryViewController(), title: "分类", imageName: "TabBar_category_23x23_")
        self.addChildViewController(viewController: HBMeViewController(), title: "我的", imageName: "TabBar_me_boy_23x23_")
    }
    
    private func addChildViewController(viewController:HBBaseViewController, title:String, imageName:String) {
        
        viewController.title = title
        viewController.tabBarItem.image = UIImage.init(named: imageName)
        viewController.tabBarItem.selectedImage = UIImage.init(named: imageName + "selected")
        let nav = HBNavigationController.init(rootViewController: viewController)
        self.addChildViewController(nav)
        
    }
}
