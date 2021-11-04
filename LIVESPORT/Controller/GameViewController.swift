//
//  GameViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/11/21.
//

import UIKit
import SDWebImage
class GameViewController: UIViewController,LeaguesDataDelegate,EventsDataDelegate {
    func didUpdateAllEvents(allEvents: Events) {
        DispatchQueue.main.async {
            Model.events = allEvents.events
            
        }
    }
    
    func didUpdateLeagues(leagues: [League]) {
        DispatchQueue.main.async {
            Model.leagues = leagues
            
        }
    }
    

   
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var tableView: UIView!
    
    @IBOutlet weak var leagueView: UIView!
    
    @IBOutlet weak var lbb: UILabel!
    var currentEvent : Event?
    var currentTeams : [Team] = []
    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    
   
    @IBAction func segmentBar(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            infoView.isHidden = false
            tableView.isHidden = true
            lbb.isHidden = true
        case 1:
            infoView.isHidden = true
            tableView.isHidden = true
            lbb.isHidden = false
            lbb.text = "Coming Soon ...."
        case 2:
            infoView.isHidden = true
            tableView.isHidden = true
            lbb.isHidden = false
            lbb.text = "Coming Soon ...."
        case 3:
            infoView.isHidden = true
            tableView.isHidden = true
            lbb.isHidden = false
            lbb.text = "Coming Soon ...."
        case 4:
            infoView.isHidden = true
            tableView.isHidden = false
            lbb.isHidden = true
        default:
            lbb.text = "Zehor"
        }
    }
    
    var network = NetworkHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        infoView.isHidden = false
        tableView.isHidden = true
        lbb.isHidden = true
        //lbb.text = "Hello"
        network.eventsDataDelegate = self
        network.leagueDelegate = self
        network.getAllLeagues(sportType: currentEvent?.strSport)
        network.getTeamsInLeague(leagueId: currentEvent!.idLeague!)
        network.getAllEvent(leaueId: (currentEvent?.idLeague!)!)
        for i in Model.teams{
            if i.strTeam == currentEvent?.strHomeTeam{
                //currentTeams.append(i)
                homeTeamLogo.sd_setImage(with: URL(string: i.strTeamBadge!), placeholderImage:UIImage(named: "sports_icon"))
            }else  if i.strTeam == currentEvent?.strAwayTeam{
                awayTeamLogo.sd_setImage(with: URL(string: i.strTeamBadge!), placeholderImage:UIImage(named: "sports_icon"))
            }
        }
        
//        gamedate.text = currentEvent?.dateEvent
        homeTeamName.text = currentEvent?.strHomeTeam
        homeTeamScore.text = currentEvent?.intHomeScore
        
        awayTeamName.text = currentEvent?.strAwayTeam
        awayTeamScore.text = currentEvent?.intAwayScore
    }
    

}
