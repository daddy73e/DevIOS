//
//  File.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/10/27.
//  Copyright © 2020 daddy73. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol MultipleRowDataViewModelType {
    var obAllMenus: BehaviorSubject<[MultipleTypeItem]> { get set }
}

class MultipleRowDataViewModel:MultipleRowDataViewModelType {
    private var disposebag = DisposeBag()
    var obAllMenus = BehaviorSubject<[MultipleTypeItem]>(value: [
        ImageItem(type: .Image, image: UIImage(named: "settings")!, title: "image1"),
        StepperItem(type: .Stepper, title: "stepper1"),
        ImageItem(type: .Image, image: UIImage(named: "settings")!, title: "image2"),
        ToggleItem(type: .Toggle, title: "toggle1", enabled: true),
        StepperItem(type: .Stepper, title: "stepper2"),
        ImageItem(type: .Image, image: UIImage(named: "settings")!, title: "image3"),
        ToggleItem(type: .Toggle, title: "toggle2", enabled: true),
        StepperItem(type: .Stepper, title: "stepper3"),
        ImageItem(type: .Image, image: UIImage(named: "settings")!, title: "settings4")
    ])
    var obShowAll = BehaviorSubject<Bool>(value:true)
    var filterType = BehaviorSubject<MultipleRowCellType>(value: .Image)
    
    /* Output */
    var obShowMenus: Observable<[MultipleTypeItem]>
    
    init() {
        
        obShowMenus = Observable
            .combineLatest(obShowAll,
                           obAllMenus,
                           filterType) { obShowAll, menus, filter in
                if obShowAll {
                    return menus
                } else {
                    return menus.filter { $0.type == filter }
                }
            }.asObservable()
        
    }
    
    public func showAllData() {
        obShowAll.onNext(true)
    }
    
    public func filterItem(type:MultipleRowCellType) {
        obShowAll.onNext(false)
        filterType.onNext(type)
    }
}
