//
//  TableViewCell.swift
//  hw3
//
//  Created by Catherine Dana on 3/3/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Detail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
