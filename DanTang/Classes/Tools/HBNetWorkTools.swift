//
//  HBNetWorkTools.swift
//  DanTang
//
//  Created by 贺兵 on 2017/5/10.
//  Copyright © 2017年 贺兵. All rights reserved.
//

import UIKit
import Alamofire

class HBNetWorkTools: NSObject {
    
    //单例
    static let networktools = HBNetWorkTools()
    
    func loadTopTitleInfo(finished:@escaping (_ chanels:[HBChanelModel]) ->()) {
        
        let url = Base_url + "v2/channels/preset"
        let params = ["gender": 1,
                      "generation": 1]
        
        Alamofire.request(url, parameters:params).responseJSON { (response) in
            
            print("2321421421412")
        }
    }
    
    // 获取首页数据
    func loadHomeInfo(id: Int, finished:@escaping (_ homeItem:[HBHomeItem]) ->()){
        
        let url = Base_url + "v1/channels/\(id)/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire.request(url, parameters:params).responseJSON { (response) in
            
            print("3e322334")
        }
    }
    
}
