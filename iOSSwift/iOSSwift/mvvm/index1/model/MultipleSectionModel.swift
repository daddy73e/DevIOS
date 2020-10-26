//
//  File.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/10/26.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit
import Differentiator

/* Section */
enum MultipleSectionModel {
    case ImageProvidableSection(title: String, items: [SectionItem])
    case ToggleableSection(title: String, items: [SectionItem])
    case StepperableSection(title: String, items: [SectionItem])
}

/* Row */
enum SectionItem {
    case ImageSectionItem(image: UIImage, title: String)
    case ToggleableSectionItem(title: String, enabled: Bool)
    case StepperSectionItem(title: String)
}


extension MultipleSectionModel: SectionModelType {
    typealias Item = SectionItem
    
    var items: [SectionItem] {
        switch  self {
        case .ImageProvidableSection(title: _, items: let items):
            return items.map { $0 }
        case .StepperableSection(title: _, items: let items):
            return items.map { $0 }
        case .ToggleableSection(title: _, items: let items):
            return items.map { $0 }
        }
    }
    
    init(original: MultipleSectionModel, items: [Item]) {
        switch original {
        case let .ImageProvidableSection(title: title, items: _):
            self = .ImageProvidableSection(title: title, items: items)
        case let .StepperableSection(title, _):
            self = .StepperableSection(title: title, items: items)
        case let .ToggleableSection(title, _):
            self = .ToggleableSection(title: title, items: items)
        }
    }
}


extension MultipleSectionModel {
    var title: String {
        switch self {
        case .ImageProvidableSection(title: let title, items: _):
            return title
        case .StepperableSection(title: let title, items: _):
            return title
        case .ToggleableSection(title: let title, items: _):
            return title
        }
    }
}
