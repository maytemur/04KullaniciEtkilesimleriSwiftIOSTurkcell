//
//  ListeCustomTableViewCell.swift
//  04KullaniciEtkilesimleri
//
//  Created by maytemur on 1.02.2023.
//

import UIKit

class ListeCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var lblMetin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
