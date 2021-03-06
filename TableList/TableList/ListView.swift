//
//  TableListCell.swift
//  TableList
//
//  Created by Syed Riyaz on 06/07/20.
//  Copyright © 2020 SivaMac. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class TableList: UIView {
    let mainView = UIView()
    let tableView = UITableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        onCreate()
    }
    func onCreate() {
        self.addSubview(mainView)
        mainView.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        mainView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        tableView.snp.makeConstraints {
            $0.left.right.top.bottom.equalTo(mainView)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
