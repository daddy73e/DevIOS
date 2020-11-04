//
//  MultipleStyleTableView.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/10/27.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class MultiRowTableViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: MultipleRowDataViewModel!
    
    init(viewModel: MultipleRowDataViewModelType = MultipleRowDataViewModel()) {
        self.viewModel = viewModel as? MultipleRowDataViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = MultipleRowDataViewModel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    private func bindUI() {
        viewModel.obShowMenus.bind(to: tableView.rx.items){(tv, row, item) -> UITableViewCell in
            switch item.type {
            case .Image:
                let item:ImageItem = item as! ImageItem
                let cell = tv.dequeueReusableCell(withIdentifier: ImageTitleTableViewCell.identifier,
                                                  for: IndexPath.init(row: row, section: 0)) as! ImageTitleTableViewCell
                cell.configure(image: item.image, title: item.title)
                return cell
                
            case .Stepper:
                let item:StepperItem = item as! StepperItem
                let cell = tv.dequeueReusableCell(withIdentifier: TitleStepperTableViewCell.identifier,
                                                  for: IndexPath.init(row: row, section: 0)) as! TitleStepperTableViewCell
                cell.configure(title: item.title)
                return cell
                
            case .Toggle:
                let item:ToggleItem = item as! ToggleItem
                let cell = tv.dequeueReusableCell(withIdentifier: TitleSwitchTableViewCell.identifier,
                                                  for: IndexPath.init(row: row, section: 0)) as! TitleSwitchTableViewCell
                cell.configure(title: item.title, isEnabled: item.enabled)
                return cell
           }
        }.disposed(by: disposeBag)
    }
    
    @IBAction func tapBtnAll(_ sender: Any) {
        viewModel.showAllData()
    }
    
    @IBAction func tapBtnImage(_ sender: Any) {
        viewModel.filterItem(type: .Image)
    }
    
    @IBAction func tapBtnStepper(_ sender: Any) {
        viewModel.filterItem(type: .Stepper)
    }
    
    @IBAction func tapBtnToggle(_ sender: Any) {
        viewModel.filterItem(type: .Toggle)
    }
}
