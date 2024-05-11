//
//  NearbyTableViewCell.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//

import UIKit

class NearbyTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var addresslabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureSelf(name: String, address: String, country: String) {
        self.nameLabel.text = name
        self.addresslabel.text = address
        self.cityLabel.text = country
    }
    
}
