//
//  TableListCell.swift
//  TableList
//
//  Created by Syed Riyaz on 06/07/20.
//  Copyright © 2020 SivaMac. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class TableListCell: UITableViewCell {
    let cellView = UIView()
    let img = UIImageView()
    let lblTittle = UILabel()
    let lblDescription = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        onCreate()
    }
    func onCreate() {
        self.selectionStyle = .none
        contentView.addSubview(cellView)
        cellView.addSubview(img)
        cellView.addSubview(lblTittle)
        cellView.addSubview(lblDescription)
        cellView.layer.cornerRadius = 10
        cellView.clipsToBounds = true
        cellView.layer.shadowOffset = CGSize(width: 0, height: 1)
        cellView.layer.shadowColor = UIColor(red:138/255, green:160/255, blue:183/255, alpha:1).cgColor 
        cellView.layer.shadowRadius = 8
        cellView.layer.shadowOpacity = 1
        cellView.layer.masksToBounds = false
        cellView.backgroundColor = .white
        self.backgroundColor = .clear
        img.backgroundColor = .lightGray
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        
        lblDescription.numberOfLines = 0
        lblDescription.lineBreakMode = .byWordWrapping
        cellView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.left.equalToSuperview().offset(5)
            $0.right.equalToSuperview().offset(-5)
            $0.bottom.equalToSuperview().offset(-5)
        }
        img.snp.makeConstraints {
            $0.left.equalTo(10)
            $0.width.height.equalTo(40)
            $0.top.equalToSuperview().offset(10)
        }

        lblTittle.snp.makeConstraints {
            $0.left.equalTo(img.snp.right).offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalTo(img)
            $0.height.equalTo(20)
        }

        lblDescription.snp.makeConstraints {
            $0.top.equalTo(lblTittle.snp.bottom).offset(10)
            $0.left.right.equalTo(lblTittle)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
