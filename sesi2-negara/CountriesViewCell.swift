//
//  CountriesViewCell.swift
//  sesi2-negara
//
//  Created by Dony Prastiya on 04/03/23.
//

import UIKit

class CountriesViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var flag: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        flag.layer.cornerRadius = 5
        flag.layer.borderWidth = 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


