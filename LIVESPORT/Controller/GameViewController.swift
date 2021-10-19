//
//  GameViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/11/21.
//

import UIKit
import SDWebImage
class GameViewController: UIViewController {

    var currentEvent : Event?
    var currentTeams : [Team] = []
    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var gamedate: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    
    var network = NetworkHandler()
    override func viewDidLoad() {
        super.viewDidLoad()

        network.getTeamsInLeague(leagueId: currentEvent!.idLeague!)

        for i in Model.teams{
            if i.strTeam == currentEvent?.strHomeTeam{
                //currentTeams.append(i)
                homeTeamLogo.sd_setImage(with: URL(string: i.strTeamBadge!), placeholderImage:UIImage(named: "sports_icon"))
            }else  if i.strTeam == currentEvent?.strAwayTeam{
                awayTeamLogo.sd_setImage(with: URL(string: i.strTeamBadge!), placeholderImage:UIImage(named: "sports_icon"))
            }
        }
        
        gamedate.text = currentEvent?.dateEvent
        leagueName.text = currentEvent?.strLeague
        
        
        homeTeamName.text = currentEvent?.strHomeTeam
        homeTeamScore.text = currentEvent?.intHomeScore
        //awayTeamLogo.sd_setImage(with: URL(string: atLogo), placeholderImage:UIImage(named: "sports_icon"))
        awayTeamName.text = currentEvent?.strAwayTeam
        awayTeamScore.text = currentEvent?.intAwayScore
    }
    

}
