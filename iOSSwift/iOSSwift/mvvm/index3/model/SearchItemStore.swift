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
    
    func allSaveItems() -> [SavedItem] {
        let savedItem = Settings.shared.recentSearchTxt()
        var savedList:[SavedItem] = []
        if savedItem.count > 0 {
            for each in savedItem {
                savedList.append(SavedItem(type: .saved, name: each))
            }
        }
        return savedList
    }
    
    
    func fetchSaveItems(text:String) -> [SavedItem] {
        let searchText = text.lowercased()
        let savedItem = Settings.shared.recentSearchTxt()
        var savedList:[SavedItem] = []
        if savedItem.count > 0 {
            if !text.isEmpty {
                for each in savedItem {
                    let lowEach = each.lowercased()
                    if lowEach.contains(searchText) {
                        savedList.append(SavedItem(type: .saved, name: each))
                    }
                }
            } else {
                for each in savedItem {
                    savedList.append(SavedItem(type: .saved, name: each))
                }
            }
        }
        
        return savedList
    }
    
    func obFetchSaveItems(text:String) -> Observable<[SavedItem]> {
        let searchText = text.lowercased()
        let savedItem = Settings.shared.recentSearchTxt()
        var savedList:[SavedItem] = []
        if savedItem.count > 0 {
            if !text.isEmpty {
                for each in savedItem {
                    let lowEach = each.lowercased()
                    if lowEach.contains(searchText) {
                        savedList.append(SavedItem(type: .saved, name: each))
                    }
                }
            } else {
                for each in savedItem {
                    savedList.append(SavedItem(type: .saved, name: each))
                }
            }
        }
        
        return Observable.create { emitter in
            emitter.onNext(savedList)
            emitter.onCompleted()
            return Disposables.create()
        }
    }
    
    func empty() -> [SavedItem] {
        let savedList:[SavedItem] = []
        return savedList
    }
    
    func obEmpty() -> Observable<[SavedItem]> {
        let savedList:[SavedItem] = []
        return Observable.create { emitter in
            emitter.onNext(savedList)
            emitter.onCompleted()
            return Disposables.create()
        }
    }
    
    
}
