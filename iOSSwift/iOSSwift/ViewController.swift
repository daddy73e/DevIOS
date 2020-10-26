//
//  ViewController.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/08/06.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DevSwift"
    }
    
    @IBAction func tapStack0(_ sender: Any) {
        let vc = MVVMViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
