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
        bindInput()
        bindOutput()
    }
    
    private func bindInput() {
        tableView.rx.modelSelected(TableItem.self)
            .bind(to: viewModel.selectedTableItem)
            .disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty
            .bind(to:viewModel.obSearchText)
            .disposed(by: disposeBag)
        
        searchBar.rx.searchButtonClicked
            .bind(to: viewModel.startSearch)
            .disposed(by: disposeBag)
    }
    
    private func bindOutput() {
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
        
        viewModel.selectedTableItem.subscribe(onNext: { model in
            if model.type == .responseData {
                let searchItem = model as! SearchItem
                self.performSegue(withIdentifier: "showDetail",
                                  sender: searchItem)
            } else if model.type == .saved {
                let savedItem = model as! SavedItem
                self.performSegue(withIdentifier: "showDetail",
                                  sender: savedItem)
            }
        }).disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            if sender is SearchItem {
                let item = sender as! SearchItem
                destination.detailInfo = item.trackName
            }
            
            if sender is SavedItem {
                let item = sender as! SavedItem
                destination.detailInfo = item.name
            }
        }
    }
    
}
