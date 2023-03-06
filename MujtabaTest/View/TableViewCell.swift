//
//  TableViewCell.swift
//  MujtabaTest
//
//  Created by Mujtaba Khan on 05/03/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerStyle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
