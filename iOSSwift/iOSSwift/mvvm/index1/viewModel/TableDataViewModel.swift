//
//  TableDataViewModel.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/10/22.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources


protocol TableDataViewModelType {
    var allMenus: Observable<[MultipleSectionModel]> { get }
}

class TableDataViewModel:TableDataViewModelType {
    /* Output */
    var allMenus: Observable<[MultipleSectionModel]>
    
    init() {        
        let sections = BehaviorSubject<[MultipleSectionModel]>(value: [
            .ImageProvidableSection(title: "Section 1",
                                    items: [.ImageSectionItem(image: UIImage(named: "settings")!, title: "Section1"),
                                            .ImageSectionItem(image: UIImage(named: "settings")!, title: "Section2")
                                    ]),
            .ToggleableSection(title: "Section 2",
                               items: [.ToggleableSectionItem(title: "On", enabled: true)]),
            .StepperableSection(title: "Section 3",
                                items: [.StepperSectionItem(title: "1")])
        ])
        
        allMenus = sections
    }
}



