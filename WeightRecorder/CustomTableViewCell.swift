//
//  CustomTableViewCell.swift
//  WeightRecorder
//
//  Created by 渡辺拓也 on 2017/05/06.
//  Copyright © 2017年 渡辺拓也. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell{

    @IBOutlet weak var cellDate: UILabel!
    @IBOutlet weak var cellWeight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
