//
//  SearchItemViewModel.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/11/03.
//  Copyright © 2020 daddy73. All rights reserved.
//

import Foundation
import RxSwift

class SearchItemViewModel {
    let disposeBag = DisposeBag()

    // INPUT
    let searchText = BehaviorSubject<String>(value: "")

    // OUTPUT
    let activated = BehaviorSubject<Bool>(value: true)
    let strResult = BehaviorSubject<String>(value: "")

    init() {
        
        let store = SearchItemStore()
        strResult.do(onNext: { _ in activated.onNext(true)})
            .flatMap(store.fetchMenus(text:))
        
//        fetchSearchItems
//            .do(onNext: { _ in activated.onNext(true) })
//            .flatMap(store.fetchMenus(text: ))
//            .flatMap(domain.fetchMenus)
//            .map { $0.map { ViewMenu($0) } }
//            .do(onNext: { _ in activating.onNext(false) })
//            .do(onError: { err in error.onNext(err) })
//            .subscribe(onNext: menus.onNext)
//            .disposed(by: disposeBag)
    }
}
