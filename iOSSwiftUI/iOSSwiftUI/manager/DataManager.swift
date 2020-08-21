//
//  DataManager.swift
//  iOSSwiftUI
//
//  Created by Yeongeun Song on 2020/08/20.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    func getMainDataList() -> Array<TestItem> {
        var itemList = Array<TestItem>()
        let item0 = TestItem(id: 0, name: "Kingfisher image List View")
        let item1 = TestItem(id: 1, name: "TEMP 0")
        let item2 = TestItem(id: 2, name: "TEMP 1")
        let item3 = TestItem(id: 3, name: "TEMP 2")
        let item4 = TestItem(id: 4, name: "TEMP 3")
        let item5 = TestItem(id: 5, name: "TEMP 4")
        
        itemList.append(item0)
        itemList.append(item1)
        itemList.append(item2)
        itemList.append(item3)
        itemList.append(item4)
        itemList.append(item5)
        return itemList
    }
    
    func getImageDataList() -> Array<ImageItem> {
        var itemList = Array<ImageItem>()
        let item0 = ImageItem(id: 0, name: "다이치", path: "https://img.danawa.com/prod_img/500000/266/507/img/10507266_1.jpg?shrink=500:500&_v=20200729094130")
        let item1 = ImageItem(id: 1, name: "페도라", path: "https://img.danawa.com/prod_img/500000/447/419/img/10419447_1.jpg?shrink=500:500&_v=20200806135616")
        let item2 = ImageItem(id: 2, name: "브라이텍스", path: "https://img.danawa.com/prod_img/500000/515/250/img/7250515_1.jpg?shrink=500:500&_v=20200723135500")
        let item3 = ImageItem(id: 3, name: "폴레드", path: "https://img.danawa.com/prod_img/500000/619/443/img/7443619_1.jpg?shrink=500:500&_v=20200722131037")
        let item4 = ImageItem(id: 4, name: "조이", path: "https://img.danawa.com/prod_img/500000/602/911/img/4911602_1.jpg?shrink=500:500&_v=20200325151032")
        itemList.append(item0)
        itemList.append(item1)
        itemList.append(item2)
        itemList.append(item3)
        itemList.append(item4)
        return itemList
    }
    
    
    
}
