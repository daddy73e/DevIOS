//
//  MainTableViewCell.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/08/18.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var labelIndex: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
