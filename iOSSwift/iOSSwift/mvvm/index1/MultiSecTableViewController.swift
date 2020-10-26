//
//  MultiSecTableViewController.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/10/22.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import Differentiator

class MultiSecTableViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: TableDataViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TableDataViewModel()
        bindUI()
    }
    
    private func bindUI() {
        viewModel.allMenus.bind(to: tableView.rx.items(dataSource: dataSource()))
            .disposed(by: disposeBag)
        
    }
    
    private func dataSource() -> RxTableViewSectionedReloadDataSource<MultipleSectionModel> {
        return RxTableViewSectionedReloadDataSource<MultipleSectionModel>(
            configureCell: { dataSource, table, idxPath, _ in
                switch dataSource[idxPath] {
                case let .ImageSectionItem(image, title):
                    let cell: ImageTitleTableViewCell = table.dequeueReusableCell(forIndexPath: idxPath)
                    cell.configure(image: image, title: title)
                    return cell
                case let .StepperSectionItem(title):
                    let cell: TitleSteperTableViewCell = table.dequeueReusableCell(forIndexPath: idxPath)
                    cell.configure(title: title)
                    return cell
                case let .ToggleableSectionItem(title, enabled):
                    let cell: TitleSwitchTableViewCell = table.dequeueReusableCell(forIndexPath: idxPath)
                    cell.configure(title: title, isEnabled: enabled)
                    return cell
                }
            },
            titleForHeaderInSection: { dataSource, index in
                let section = dataSource[index]
                return section.title
            }
        )
    }
}
