//
//  DetailViewController.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/11/05.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    static let identifier = "DetailViewController"
    
    @IBOutlet weak var labelDetailInfo: UILabel!
    public var detailInfo:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let info = detailInfo {
            labelDetailInfo.text = info
        }
    }
}
