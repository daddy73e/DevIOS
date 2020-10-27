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


protocol MultipleSecDataViewModelType {
    var allMenus: Observable<[MultipleSectionModel]> { get }
}

class MultipleSecDataViewModel:MultipleSecDataViewModelType {
    /* Output */
    var allMenus: Observable<[MultipleSectionModel]>
    
    init() {        
        let sections = BehaviorSubject<[MultipleSectionModel]>(value: [
            .ImageProvidableSection(title: "Section 1",
                                    items: [.ImageSectionItem(image: UIImage(named: "settings")!, title: "Image1"),
                                            .ImageSectionItem(image: UIImage(named: "settings")!, title: "Image2"),
                                            .ImageSectionItem(image: UIImage(named: "settings")!, title: "Image3"),
                                            .ImageSectionItem(image: UIImage(named: "settings")!, title: "Image4")
                                    ]),
            .ToggleableSection(title: "Section 2",
                               items: [.ToggleableSectionItem(title: "On1", enabled: true),
                                       .ToggleableSectionItem(title: "On2", enabled: true),
                                       .ToggleableSectionItem(title: "Off1", enabled: false),
                                       .ToggleableSectionItem(title: "Off2", enabled: false)]),
            .StepperableSection(title: "Section 3",
                                items: [.StepperSectionItem(title: "stepper0"),
                                        .StepperSectionItem(title: "stepper1"),
                                        .StepperSectionItem(title: "stepper2"),
                                        .StepperSectionItem(title: "stepper3")])
        ])
        
        allMenus = sections
    }
}



