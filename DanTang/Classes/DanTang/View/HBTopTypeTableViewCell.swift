//
//  HBTopTypeTableViewCell.swift
//  DanTang
//
//  Created by 贺兵 on 2017/5/11.
//  Copyright © 2017年 贺兵. All rights reserved.
//

import UIKit
import Kingfisher

protocol HBTopTypeTableViewCellDelegate:NSObjectProtocol {
    
    func callback()
}

class HBTopTypeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var favoriteBtn: UIButton!
    
    @IBOutlet weak var titleLab: UILabel!
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    weak var delegate:HBTopTypeTableViewCellDelegate?
    
    var homeItem: HBHomeItem? {
        
        willSet{
            
            let url = newValue?.cover_image_url
            self.bgImageView.kf.setImage(with: URL.init(string: url!), placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                
            }
            titleLab.text = newValue?.title
            favoriteBtn.setTitle(" " + String(describing: newValue!.likes_count!) + " ", for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
        self.setupUI()
    }
    
    func setupUI() {
        
        self.favoriteBtn.backgroundColor = UIColor.gray
        self.favoriteBtn.layer.cornerRadius = 5.0
        self.favoriteBtn.layer.masksToBounds = true
        
        self.bgImageView.layer.cornerRadius = 5.0
        self.bgImageView.clipsToBounds = true
        
    }
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        
        delegate?.callback()
        
    }
    
}
