//
//  APIReqResViewController.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/11/03.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import Differentiator

class APIReqResViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = SearchItemViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    private func bindUI() {
        viewModel.obActivated
            .subscribeOn(MainScheduler.instance)
            .subscribe{    
                self.indicator.isHidden = !$0
            }
            .disposed(by: disposeBag)
        
        viewModel.obResponseItems.bind(to: tableView.rx.items) { (tv, row, item) -> UITableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier,
                                              for: IndexPath.init(row: row, section: 0)) as! ItemTableViewCell
            cell.configure(txt: item.trackName)
            return cell
        }
        .disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty
            .bind(to:viewModel.obSearchText)
            .disposed(by: disposeBag)
        
        searchBar.rx.searchButtonClicked
            .bind(to:viewModel.fetchMenus
        ).disposed(by: disposeBag)
        
        searchBar.rx.searchButtonClicked.bind{
            self.viewModel.obResultText.onNext(self.viewModel.obSearchText.value)
        }.disposed(by: disposeBag)
        
    }
    
}
