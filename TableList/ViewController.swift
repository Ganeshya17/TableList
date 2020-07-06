//
//  ViewController.swift
//  TableList
//
//  Created by SivaMac on 6/7/20.
//  Copyright © 2020 SivaMac. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit

class ViewController: UIViewController {

    let tableListView = TableList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(tableListView)
        
        tableListView.snp.makeConstraints{
            $0.left.right.top.bottom.equalToSuperview()
        }
        tableListView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ListData")
        tableListView.tableView.delegate = self
        tableListView.tableView.dataSource = self
       
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListData", for: indexPath)
        cell.textLabel?.text = "suyfygzhj"
        return cell
    }
    
    
}

