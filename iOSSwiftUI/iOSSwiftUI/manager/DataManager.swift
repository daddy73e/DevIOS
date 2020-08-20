//
//  DataManager.swift
//  iOSSwiftUI
//
//  Created by Yeongeun Song on 2020/08/20.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    func getDataList() -> Array<TestItem> {
        var itemList = Array<TestItem>()
        let item0 = TestItem(id: 0, name: "Example List View")
        let item1 = TestItem(id: 1, name: "TEMP 0")
        let item2 = TestItem(id: 2, name: "TEMP 1")
        itemList.append(item0)
        itemList.append(item1)
        itemList.append(item2)
        return itemList
    }
    
    
    
}
