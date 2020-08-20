//
//  ViewController.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/08/06.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableList: UITableView!
    private var cellId = "MainTableViewCell"
    private var dataList = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DevSwift"
        tableList.dataSource = self
        tableList.delegate = self
        tableList.register(UINib(nibName: self.cellId, bundle: nil),
                           forCellReuseIdentifier: self.cellId)
        
        dataList = loadTableList()
        tableList.reloadData()
    }
    
    private func loadTableList() -> Array<String> {
        var array = Array<String>()
        array.append("Rx & MVVM")
        array.append("QR Code")
        return array
    }
}


extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId) as? MainTableViewCell {
            cell.selectionStyle = .none
            
            let item = dataList[indexPath.row]
            cell.labelIndex.text = "\(indexPath.row + 1)".oneCharValue()
            cell.labelName.text = item
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let vc = MVVMViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = QRScanViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            return
        }
    }
}
