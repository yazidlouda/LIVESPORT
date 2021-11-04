//
//  InfoViewController.swift
//  LIVESPORT
//
//  Created by Home on 11/4/21.
//

import UIKit

class InfoViewController: UIViewController,LeaguesDataDelegate,EventsDataDelegate {
    func didUpdateLeagues(leagues: [League]) {
        DispatchQueue.main.async {
            Model.leagues = leagues
            
        }
    }
    
    func didUpdateAllEvents(allEvents: Events) {
        DispatchQueue.main.async {
            Model.events = allEvents.events
            
        }
    }
    var network = NetworkHandler()
    static var currentEvent : Event?
    @IBOutlet weak var gameTime: UILabel!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var gameLogo: UIImageView!
    @IBOutlet weak var lineUpe: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leaguebadge: UIImageView!
    @IBOutlet weak var gamedate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        network.eventsDataDelegate = self
        network.leagueDelegate = self
        network.getAllLeagues(sportType: InfoViewController.currentEvent?.strSport)
        network.getTeamsInLeague(leagueId: InfoViewController.currentEvent!.idLeague!)
        network.getAllEvent(leaueId: (InfoViewController.currentEvent?.idLeague!)!)
        
        lineUpe.text = InfoViewController.currentEvent?.strDescriptionEN ?? "No description"
        gameLogo.sd_setImage(with: URL(string: (InfoViewController.currentEvent?.strThumb!)!), placeholderImage:UIImage(named: "sports_icon"))
        
               
        
               
                for x in Model.leagueDetails{
                    if x.idLeague == InfoViewController.currentEvent?.idLeague{
                        leaguebadge.sd_setImage(with: URL(string: x.strBadge),placeholderImage:UIImage(named: "sports_icon"))
                    }
        
                }
        gameTime.text = InfoViewController.currentEvent?.strTime
        gamedate.text = InfoViewController.currentEvent?.dateEvent
        leagueName.text = InfoViewController.currentEvent?.strLeague
                
    }
    

   

}
