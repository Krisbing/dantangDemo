//
//  UIView+HBAdd.swift
//  DanTang
//
//  Created by 贺兵 on 2017/5/11.
//  Copyright © 2017年 贺兵. All rights reserved.
//

import UIKit

let refresh_key = "refreshKey"

extension UIView {
    
    /// 裁剪 view 的圆角
    func clipRectCorner(direction: UIRectCorner, cornerRadius: CGFloat) {
        let cornerSize = CGSize(width: cornerRadius, height: cornerRadius)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
    }
    
    //定义私有结构体,目的是为了防止命名污染整个命名空间
    private struct AssociatedKeys{
        static let refresh_key = "refresh_key"
    }
    //当前下载操作的URL
    //使用关联度细给分类加属性
    var activityView : UIActivityIndicatorView? {
        get
        {
            return objc_getAssociatedObject(self, AssociatedKeys.refresh_key) as? UIActivityIndicatorView
        }
        
        set(newValue)
        {
            if let newValue = newValue
            {
                objc_setAssociatedObject(
                    self,
                    AssociatedKeys.refresh_key,
                    newValue as UIActivityIndicatorView?,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    
    func addRefreshActivityView() {

        activityView = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
        activityView?.center = self.center
        self.addSubview(activityView!)
        activityView?.startAnimating()
    }
    
    func removeRefreshActivityView() {
        
        activityView?.stopAnimating()
        activityView?.removeFromSuperview()
    }
    
    /// x
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x    = newValue
            frame                 = tempFrame
        }
    }
    
    /// y
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y    = newValue
            frame                 = tempFrame
        }
    }
    
    /// height
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame                 = tempFrame
        }
    }
    
    /// width
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    /// size
    var size: CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// centerX
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    /// centerY
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }

}
