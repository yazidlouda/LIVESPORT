//
//  LeageViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/11/21.
//

import UIKit
import SDWebImage
class LeageViewController: UIViewController, EventsDataDelegate, TeamsDataDelegate {
    func didUpdateAllEvents(allEvents: [Event]) {
        DispatchQueue.main.async {
            Model.events = allEvents
            self.tableView.reloadData();
            
           
        }
    }
    
    func didUpdateTeama(teams: Teams) {
        DispatchQueue.main.async {
            Model.teams = teams.teams
            self.tableView.reloadData()
            
        }
    }
    

    var row:Int?
    @IBOutlet weak var tableView: UITableView!
    var networkHandler = NetworkHandler()
    var currentLeague:League?
    static var currentId = ""
    var selectedTeam:Team?
    //static var strSport = ""
    
    override func viewWillAppear(_ animated: Bool) {
        networkHandler.eventsDataDelegate = self
        networkHandler.teamsDataDelegate = self
        networkHandler.getAllEvent(leaueId: LeageViewController.currentId)
        networkHandler.getTeamsInLeague(leagueId: LeageViewController.currentId)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkHandler.getAllEvent(leaueId: LeageViewController.currentId)
        networkHandler.getTeamsInLeague(leagueId: LeageViewController.currentId)
        tableView.delegate = self
        tableView.dataSource = self
        
       
    }
    


}

extension LeageViewController : UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return Model.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
      //  let minutes = calendar.component(.minute, from: date)
        var homeTeamLogo = ""
        var awayTeamLogo = ""
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell" , for: indexPath) as! LeagueTableViewCell
        
        let homeTeamName = Model.events[indexPath.row].strHomeTeam
        let awayTeamName = Model.events[indexPath.row].strAwayTeam
        let homeScore:Int = Int(Model.events[indexPath.row].intHomeScore)!
        let awayScore:Int = Int(Model.events[indexPath.row].intAwayScore)!
        
        for i in Model.teams{
            if i.strTeam == homeTeamName{
              
                homeTeamLogo = i.strTeamBadge!
            }
            if i.strTeam == awayTeamName{
               
                awayTeamLogo = i.strTeamBadge!
            }
        }
        if Model.events[indexPath.row].dateEvent < calendar.description {
            cell.gameTime.text = "Full Time"
        }else{
            cell.gameTime.text = Model.events[indexPath.row].strTime
        }
        cell.gameDate.text = Model.events[indexPath.row].dateEvent
        
        cell.leagueView.layer.cornerRadius = 20
        cell.homeTeamScore.text = "\(homeScore)"
        cell.awayTeamScore.text = "\(awayScore)"
        cell.hometeamname.text = "\(homeTeamName)"
        cell.awayTeamName.text = "\(awayTeamName)"
        cell.homeTeamLogo.sd_setImage(with: URL(string: homeTeamLogo), placeholderImage:UIImage(named: "sports_icon"))
        cell.awayTeamLogo.sd_setImage(with: URL(string: awayTeamLogo), placeholderImage:UIImage(named: "sports_icon"))
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
        self.performSegue(withIdentifier: "showGameDetails", sender: (Any).self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGameDetails"{
            let vc = segue.destination as! GameViewController
            
            vc.currentEvent = Model.events[row!]
            //vc.gDate = Model.events[row!].dateEvent
            
        }
    }
}
