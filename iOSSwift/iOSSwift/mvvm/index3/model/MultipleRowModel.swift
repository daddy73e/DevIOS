//
//  MultipleRowModel.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/10/27.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit

enum MultipleRowCellType {
    case Image
    case Stepper
    case Toggle
}

protocol MultipleTypeItem {
    var type:MultipleRowCellType { get }
    var title:String { get }
}

struct ImageItem:MultipleTypeItem {
    var type: MultipleRowCellType
    var image:UIImage
    var title: String
}

struct StepperItem:MultipleTypeItem {
    var type: MultipleRowCellType
    var title: String
}

struct ToggleItem:MultipleTypeItem {
    var type: MultipleRowCellType
    var title: String
    var enabled: Bool
}




