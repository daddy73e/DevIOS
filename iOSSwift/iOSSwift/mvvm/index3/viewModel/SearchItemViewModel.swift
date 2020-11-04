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
    let store = SearchItemStore()
    let fetchMenus: AnyObserver<Void>

    // OUTPUT
    let obActivated :Observable<Bool>
    let obSearchText = BehaviorRelay<String>(value: "")
    let obResultText = PublishSubject<String>()
    let obResponseItems = BehaviorSubject<[SearchItem]>(value: [])

    init() {
        let activating = BehaviorSubject<Bool>(value: false)
        obActivated = activating.distinctUntilChanged()
        
        let fetching = PublishSubject<Void>()
        fetchMenus = fetching.asObserver()
        
        obResultText
            .do(onNext: { _ in
                    activating.onNext(true)  
            })
            .flatMap{self.store.fetchMenus(text: $0)}
            .do(onNext: { _ in activating.onNext(false) })
            .subscribe(onNext:obResponseItems.onNext)
            .disposed(by: disposeBag)
    }
    
}
