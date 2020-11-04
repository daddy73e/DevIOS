//
//  ItemTableViewCell.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/11/04.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    static let identifier = "ItemTableViewCell"
    
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func configure(txt:String) {
        labelTitle.text = txt
    }
}
