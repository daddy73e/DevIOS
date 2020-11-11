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
    func fetchSearchItems(text:String) -> Observable<[SearchItem]>
}

class SearchItemStore: SearchFetchable {
    func fetchSearchItems(text:String) -> Observable<[SearchItem]> {
        return ApiService.fetchAllSearchItemRx(text: text)
    }
    
    func fetchSaveItems() -> Observable<[SavedItem]> {
        let savedItem = Settings.shared.recentSearchTxt()
        var savedList:[SavedItem] = []
        if savedItem.count > 0 {
            for each in savedItem {
                savedList.append(SavedItem(type: .saved, name: each))
            }
        }
        
        return Observable.create { emitter in
            emitter.onNext(savedList)
            emitter.onCompleted()
            return Disposables.create()
        }
    }
}
