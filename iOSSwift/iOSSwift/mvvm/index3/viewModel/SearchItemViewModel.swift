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
    
    /* INPUT */
    let fetchMenus: AnyObserver<Void>
    let startSearch: AnyObserver<Void>
    let searchAniFinish: AnyObserver<Void>
    let selectedTableItem = PublishSubject<TableItem>()
    
    // OUTPUT
    let obActivated: Observable<Bool>
    let obSearchText = BehaviorRelay<String>(value: "")
    let obResultText = PublishSubject<String>()
    let obResponseItems = BehaviorSubject<[TableItem]>(value: [])
    
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
            .flatMap{store.fetchSearchItems(text: $0)}
            .do(onNext: { _ in activating.onNext(false)})
            .subscribe(onNext:obResponseItems.onNext)
            .disposed(by: disposeBag)
        
        let finishAnimating = PublishSubject<Void>()
        searchAniFinish = finishAnimating.asObserver()
        
        
        
        /* Search text changing Event*/
        obSearchText.asObservable()
            .flatMap{store.fetchSaveItems(text: $0)}
            .subscribe(onNext:obResponseItems.onNext)
            .disposed(by: disposeBag)
        
        
        /* Search action Event*/
        let searching = PublishSubject<Void>()
        startSearch = searching.asObserver()
        searching.subscribe(onNext: {
            self.obResultText.onNext(self.obSearchText.value)
        }).disposed(by: disposeBag)
    }
}
