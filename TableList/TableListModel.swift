//
//  TableListModel.swift
//  TableList
//
//  Created by Syed Riyaz on 06/07/20.
//  Copyright © 2020 SivaMac. All rights reserved.
//

import Foundation


struct TableListModel: Codable {
    let title: String
    let rows: [Row]
}

// MARK: - Row
struct Row: Codable {
    let title, rowDescription: String?
    let imageHref: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
