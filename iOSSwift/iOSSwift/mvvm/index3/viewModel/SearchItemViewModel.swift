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
    let obSearchText:AnyObserver<String>
    let obResultText:AnyObserver<String>
    let obShowTable: AnyObserver<Bool>
    let selectedTableItem = PublishSubject<TableItem>()
    
    // OUTPUT
    let obActivated: Observable<Bool>
    let isShowTable = BehaviorSubject<Bool>(value: true)
    let obResponseItems = BehaviorSubject<[TableItem]>(value: [])
    let obResultType = BehaviorSubject<ResultType>(value: .savedAll)
    
    init() {
        let store = SearchItemStore()
        
        /* loadingView */
        let activating = BehaviorSubject<Bool>(value: false)
        obActivated = activating.distinctUntilChanged()
        
        let searchText = BehaviorSubject<String>(value: "")
        obSearchText = searchText.asObserver()
        searchText
            .flatMap{
                store.obFetchSaveItems(text: $0)
            }
            .subscribe(onNext:obResponseItems.onNext)
            .disposed(by: disposeBag)
        
        let resultText = BehaviorSubject<String>(value: "")
        obResultText = resultText.asObserver()
        resultText
            .do(onNext: { _ in activating.onNext(true) })
            .flatMap{store.fetchSearchItems(text: $0)}
            .do(onNext: { _ in activating.onNext(false)})
            .subscribe(onNext:obResponseItems.onNext)
            .disposed(by: disposeBag)
        
        let showTable = BehaviorSubject<Bool>(value: true)
        obShowTable = showTable.asObserver()
        showTable.subscribe { (isShow) in
            self.isShowTable.onNext(isShow)
        }.disposed(by: disposeBag)
    }
}
