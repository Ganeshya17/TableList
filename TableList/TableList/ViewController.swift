//
//  TableListCell.swift
//  TableList
//
//  Created by Syed Riyaz on 06/07/20.
//  Copyright © 2020 SivaMac. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit

class ViewController: UIViewController {

    let tableListView = TableList()
    var jsonarr: TableListModel?
    var refreshControl = UIRefreshControl()
    @IBOutlet weak var navigationBar: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(tableListView)
        tableListView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        tableListView.tableView.register(TableListCell.self, forCellReuseIdentifier: "ListData")
        tableListView.tableView.delegate = self
        tableListView.tableView.dataSource = self
        tableListView.tableView.rowHeight = UITableView.automaticDimension
        tableListView.tableView.estimatedRowHeight = 60
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableListView.tableView.addSubview(refreshControl)
        listdata()
    }
    @objc func refresh(_ sender: AnyObject) {
        // Code to refresh table view
        listdata()
    }
    func listdata() {
        let jsonUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        guard let url = URL(string: jsonUrl)  else {
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { data, response, error -> Void in
            guard let data = data else { return }
            do {
                let str = String(decoding: data, as: UTF8.self)
                let data = str.data(using: .utf8)!
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [String:Any] {
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                        self.jsonarr = try JSONDecoder().decode(TableListModel.self, from: jsonData)
                        print(self.jsonarr?.title ?? "")
                        DispatchQueue.main.async {
                            self.navigationBar.title = self.jsonarr?.title ?? ""
                            self.refreshControl.endRefreshing()
                            self.tableListView.tableView.reloadData()
                        }
                    } else {
                        print("bad json")
                    }
                }

            } catch {
                print("error", error)
            }
        })
        task.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jsonarr?.rows.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableListCell = tableView.dequeueReusableCell(withIdentifier: "ListData", for: indexPath) as! TableListCell
        let row = self.jsonarr?.rows
        cell.lblTittle.text = row?[indexPath.row].title
        cell.lblDescription.text = row?[indexPath.row].rowDescription
        let urlImage = row?[indexPath.row].imageHref?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        print("urlImage", urlImage ?? "")
        cell.img.sd_setImage(with: URL(string: urlImage ?? ""), placeholderImage: nil, options: .refreshCached, completed: nil)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
