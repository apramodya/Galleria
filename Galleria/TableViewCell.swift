//
//  TableViewCell.swift
//  Galleria
//
//  Created by Pramodya Abeysinghe on 31/3/19.
//  Copyright © 2019 Pramodya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellTitleLbl: UILabel!
    @IBOutlet weak var cellDescLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
