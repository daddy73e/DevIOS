//
//  MVVMViewController.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/08/18.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MVVMViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    
    var viewModel: MVVMViewModel!
    let disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: "MVVMViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let inputs = MVVMViewModel.Inputs(
            tapPlus: btnPlus.rx.tap.map { _ in },
            tapMinus: btnMinus.rx.tap.map { _ in }
        )
        
        viewModel = MVVMViewModel(inputs)
        viewModel.number
            .drive(label.rx.text)
            .disposed(by: disposeBag)
    }

}
