//
//  CountryLeagueTableViewCell.swift
//  LIVESPORT
//
//  Created by Home on 10/18/21.
//

import UIKit

class CountryLeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueView: UIView!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
