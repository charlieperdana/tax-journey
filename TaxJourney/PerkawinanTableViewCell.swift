//
//  PerkawinanTableViewCell.swift
//  TaxJourney
//
//  Created by Kendra Arsena Wijaya on 06/04/21.
//

import UIKit

class PerkawinanTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTvPerkawinan: UILabel!
    @IBOutlet weak var txtTvPerkawinan: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
