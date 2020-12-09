//
//  ProtocolViewController.swift
//  iOSSwift
//
//  Created by ygsong on 2020/12/09.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit

class ProtocolViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var test = Test()
        print(test.value0)
        
        test.modifyValue(value: "changed")
        print(test.value0)
        
        test.fly()
        test.move()
    }
}

struct Test: FlyAble, MoveAble {
    
    var value0 = "origin"
    mutating func modifyValue(value:String) {
        self.value0 = value
    }
}

protocol FlyAble {
    func fly()
}

protocol MoveAble {
    func move()
}

extension FlyAble {
    func fly() {
        print("origin fly")
    }
}

extension MoveAble {
    func move() {
        print("origin move")
    }
}
