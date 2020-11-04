//
//  SearchItemViewModel.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/11/03.
//  Copyright © 2020 daddy73. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SearchItemViewModel {
    
    let disposeBag = DisposeBag()
    let fetchMenus: AnyObserver<Void>
    
    // OUTPUT
    let obActivated: Observable<Bool>
    let obSearchText = BehaviorRelay<String>(value: "")
    let obResultText = PublishSubject<String>()
    let obResponseItems = BehaviorSubject<[TableItem]>(value: [])
    var obSavedSearchList = BehaviorSubject<[String]>(value: [])
    
    init() {
        let store = SearchItemStore()
        
        /* loadingView */
        let activating = BehaviorSubject<Bool>(value: false)
        obActivated = activating.distinctUntilChanged()
        
        /* data update */
        let fetching = PublishSubject<Void>()
        fetchMenus = fetching.asObserver()
        obResultText
            .do(onNext: { _ in activating.onNext(true) })
            .do(onNext: { Settings.shared.searchText = $0 })
            .flatMap{store.fetchMenus(text: $0)}
            .do(onNext: { _ in activating.onNext(false)})
            .subscribe(onNext:obResponseItems.onNext)
            .disposed(by: disposeBag)
        
        /* saved data update */
        let savedItem = Settings.shared.recentSearchTxt()
        var savedList:[SavedItem] = []
        if savedItem.count > 0 {
            for each in savedItem {
                savedList.append(SavedItem(type: .saved, name: each))
            }
        }
        obResponseItems.onNext(savedList)
    }
    
}
