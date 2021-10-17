//
//  LeagueTableViewCell.swift
//  LIVESPORT
//
//  Created by Home on 10/11/21.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueView: UIView!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var gameDate: UILabel!
    @IBOutlet weak var gameTime: UILabel!
    @IBOutlet weak var hometeamname: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func viewDidLoad(){
        leagueView.layer.cornerRadius = 20
    }
}
