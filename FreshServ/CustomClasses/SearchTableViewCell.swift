//
//  SearchTableViewCell.swift
//  FreshServ
//
//  Created by IOSUSER on 2/28/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
