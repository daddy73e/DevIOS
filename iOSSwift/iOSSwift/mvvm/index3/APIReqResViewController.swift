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
            .observeOn(MainScheduler.instance)
            .subscribe{    
                self.indicator.isHidden = !$0
            }
            .disposed(by: disposeBag)
        
        viewModel.obResponseItems.bind(to: tableView.rx.items) {
            (tv, row, item) -> UITableViewCell in
            if item.type == .responseData {
                let responseItem:SearchItem = item as! SearchItem
                let cell = tv.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier,
                                                  for: IndexPath.init(row: row, section: 0)) as! ItemTableViewCell
                cell.configure(txt: responseItem.trackName)
                return cell
                
            } else if item.type == .saved {
                let savedItem:SavedItem = item as! SavedItem
                let cell = tv.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier,
                                                  for: IndexPath.init(row: row, section: 0)) as! ItemTableViewCell
                cell.configure(txt: savedItem.name)
                return cell
                
            } else {
                return UITableViewCell()
            }
        }.disposed(by: disposeBag)
    
        
        searchBar.rx.text.orEmpty
            .bind(to:viewModel.obSearchText)
            .disposed(by: disposeBag)
        
        searchBar.rx.searchButtonClicked.bind{
            self.viewModel.obResultText.onNext(self.viewModel.obSearchText.value)
            self.view.endEditing(true)
        }.disposed(by: disposeBag)
        
    }
    
}
