//
//  TableItem.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/11/04.
//  Copyright © 2020 daddy73. All rights reserved.
//

import Foundation

protocol TableItem {
    var type:MultiTableType { get }
}

enum MultiTableType {
    case none
    case saved
    case responseData
}
