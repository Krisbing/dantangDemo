//
//  HBNetWorkTools.swift
//  DanTang
//
//  Created by 贺兵 on 2017/5/10.
//  Copyright © 2017年 贺兵. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HBNetWorkTools: NSObject {
    
    //单例
    static let networktools = HBNetWorkTools()
    
    //获取首页标签数据
    func loadTopTitleInfo(finished:@escaping (_ chanels:[HBChanelModel]) ->()) {
        
        let url = Base_url + "v2/channels/preset"
        let params = ["gender": 1,
                      "generation": 1]
        
        Alamofire.request(url, parameters:params).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                
                print("失败了。。")
                return;
            }
            if let value = response.value {
                
                let dict = JSON.init(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    print(message)
                    
                    return;
                }
                
                let data = dict["data"].dictionary
                if let channels = data?["channels"]?.arrayObject {
                    
                    var hb_channels = [HBChanelModel]()
                    for channel in channels {
                        let hb_channel = HBChanelModel(dict: channel as! [String : AnyObject])
                        hb_channels.append(hb_channel)
                    }
                    
                    finished(hb_channels)
                }
                
            }

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
            
            guard response.result.isSuccess else {
                
                print("失败了。。。")
                return;
            }
            
            if let value = response.value {
                
                let dict = JSON.init(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                
                guard code == RETURN_OK else {
                    
                    print(message)
                    return;
                }
                
                let data = dict["data"].dictionary
                if let items = data!["items"]?.arrayObject {
                    var homeItems = [HBHomeItem]()
                    for item in items {
                        
                        let homeItem = HBHomeItem.init(dict: item as! [String : AnyObject])
                        homeItems.append(homeItem)
                    }
                    finished(homeItems)
                }
            }
        }
    }
    
}
