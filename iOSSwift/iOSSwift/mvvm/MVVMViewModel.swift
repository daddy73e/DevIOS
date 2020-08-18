//
//  MVVMViewModel.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/08/18.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MVVMViewModel {
    
    struct Inputs {
        let tapPlus: Observable<Void>
        let tapMinus: Observable<Void>
    }
    
    private let model = BehaviorRelay<MVVMModel>(value: .init(count: 0))
    
    let number: Driver<String>
    let disposeBag = DisposeBag()
    
    init(_ inputs: Inputs) {
        number = model
            .map { "\($0.count)" }
            .asDriver(onErrorRecover: { _ in .empty() })
        
        inputs.tapPlus
            .withLatestFrom(model)
            .map { model -> MVVMModel in
                var model = model
                model.count += 1
                return model
            }.bind(to: model)
            .disposed(by: disposeBag)
        
        inputs.tapMinus
            .withLatestFrom(model)
            .map { model -> MVVMModel in
                var model = model
                model.count -= 1
                return model
            }.bind(to: model)
            .disposed(by: disposeBag)
        
        
    }
}
