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


class APIReqResViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var labelResultText: UILabel!
    
    let viewModel = SearchItemViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    private func bindUI() {
        viewModel.activated
            .subscribe{self.indicator.isHidden = !$0}
            .disposed(by: disposeBag)

        
    }
    
    @IBAction func tapBtnSearch(_ sender: Any) {
        if let text = searchBar.text {
            viewModel.searchText.onNext(text)
        }
    }
    
}
