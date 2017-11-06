//
//  CellView.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 11/5/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit

class CellView: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
