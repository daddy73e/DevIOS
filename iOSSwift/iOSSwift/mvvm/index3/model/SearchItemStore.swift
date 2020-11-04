//
//  SearchItemStore.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/11/03.
//  Copyright © 2020 daddy73. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchFetchable {
    func fetchMenus(text:String) -> Observable<[SearchItem]>
}

class SearchItemStore: SearchFetchable {
    func fetchMenus(text:String) -> Observable<[SearchItem]> {
        return ApiService.fetchAllSearchItemRx(text: text)
    }
}
