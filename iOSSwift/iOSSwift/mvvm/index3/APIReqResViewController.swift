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
import RxViewController

class APIReqResViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar { return searchController.searchBar }

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = SearchItemViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        bindInput()
        bindOutput()
    }
    
    private func config() {
        let boundSpaceView = UIView()
        boundSpaceView.backgroundColor = .white
        self.tableView.backgroundView = boundSpaceView
        tableView.alwaysBounceHorizontal = false
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchBar.placeholder = "App Store"
        searchBar.searchBarStyle = .default
        searchBar.backgroundImage = UIImage()
        searchBar.backgroundColor = .white
        searchBar.setValue("취소", forKey: "cancelButtonText")
        navigationItem.title = "검색"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func bindInput() {
        
        tableView.rx.modelSelected(TableItem.self)
            .bind(to: viewModel.selectedTableItem)
            .disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty
            .bind(to:viewModel.obSearchText)
            .disposed(by: disposeBag)
        
        searchController.rx.willPresent
            .map{return false}
            .bind(to: viewModel.obShowTable)
            .disposed(by: disposeBag)
        
        searchController.rx.didPresent
            .map{return true}
            .bind(to: viewModel.obShowTable)
            .disposed(by: disposeBag)
        
        searchBar.rx.searchButtonClicked
            .map { return (self.searchBar.text ?? "") }
            .bind(to: viewModel.obResultText)
            .disposed(by: disposeBag)
        
        searchBar.rx.cancelButtonClicked
            .map { return ""}
            .bind(to: viewModel.obSearchText)
            .disposed(by: disposeBag)

    }
    
    private func bindOutput() {
        viewModel.obActivated
            .observeOn(MainScheduler.instance)
            .subscribe{
                self.indicator.isHidden = !$0
            }
            .disposed(by: disposeBag)
        
        viewModel.isShowTable
            .observeOn(MainScheduler.instance)
            .subscribe{
                self.animate(isShow: $0)
            }.disposed(by: disposeBag)
        
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
                self.searchBar.text = savedItem.name
                self.searchBar.becomeFirstResponder()
                self.viewModel.obResultText.onNext(savedItem.name)
            }
        }).disposed(by: disposeBag)
    }
    
    public func animate(isShow:Bool) {
        if isShow {
            self.tableView.alpha = 0
        } else {
            self.tableView.alpha = 1
        }
        
        UIView.animate(withDuration: 0.3) {
            if isShow {
                self.tableView.alpha = 1
            } else {
                self.tableView.alpha = 0
            }
            self.tableView.isHidden = !isShow
            self.view.layoutIfNeeded()
        }
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
                
                /* 변경 */
            }
        }
    }
    
}
