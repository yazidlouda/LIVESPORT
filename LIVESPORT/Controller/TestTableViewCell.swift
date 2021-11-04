//
//  TestTableViewCell.swift
//  LIVESPORT
//
//  Created by Home on 11/3/21.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var rankingNumber: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var gamePlayed: UILabel!
    @IBOutlet weak var goalDifference: UILabel!
    @IBOutlet weak var points: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
