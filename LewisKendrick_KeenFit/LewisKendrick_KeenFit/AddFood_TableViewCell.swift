//
//  AddFood_TableViewCell.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/7/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import UIKit

class AddFood_TableViewCell: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCalories: UILabel!
    @IBOutlet weak var brandName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
