//
//  HBConst.swift
//  DanTang
//
//  Created by 贺兵 on 2017/5/10.
//  Copyright © 2017年 贺兵. All rights reserved.
//

import Foundation
import UIKit

let KTitleViewHeight:CGFloat = 35

let PNavBarHeight:CGFloat = 64

let Base_url = "http://api.dantangapp.com/"

/// code 码 200 操作成功
let RETURN_OK = 200

//屏幕宽度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
//屏幕高度
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
//RGBA的颜色设置
func HBRGBA(r: CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
/// 红色
func HBGlobalRedColor() -> UIColor {
    return HBRGBA(r: 245, g: 80, b: 83, a: 1.0)
}
//背景灰色
func HBGlobalColor() -> UIColor {
    return HBRGBA(r: 240, g: 240, b: 240, a: 1)
}
