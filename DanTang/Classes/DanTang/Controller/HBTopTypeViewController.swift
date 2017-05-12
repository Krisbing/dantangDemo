//
//  HBTopTypeViewController.swift
//  DanTang
//
//  Created by 贺兵 on 2017/5/11.
//  Copyright © 2017年 贺兵. All rights reserved.
//

import UIKit

let cellID = "cellID"

class HBTopTypeViewController: UITableViewController {

    var type:Int = 0
    
    var items = [HBHomeItem]()
    
    func requestData() {
        
        weak var weakself = self
        HBNetWorkTools.networktools.loadHomeInfo(id: type) { (homeItems:[HBHomeItem]) in
            
            weakself?.items = homeItems
            weakself?.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
        self.requestData()
    }

    func setupTableView() {
        
        self.tableView.rowHeight = 160
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib.init(nibName: "HBTopTypeTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        self.tableView.contentInset = UIEdgeInsetsMake(PNavBarHeight + KTitleViewHeight, 0, (self.tabBarController?.tabBar.height)!, 0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! HBTopTypeTableViewCell
        cell.homeItem = self.items[indexPath.row]
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = HBDetailViewController()
        detailVC.homeItem = self.items[indexPath.row]
        detailVC.title = "攻略详情"
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
extension HBTopTypeViewController:HBTopTypeTableViewCellDelegate {
    
    func callback() {
        
        print("love....")
    }
    
}
