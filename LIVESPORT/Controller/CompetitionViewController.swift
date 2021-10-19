//
//  CompetitionViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/6/21.
//

import UIKit
import SDWebImage
class CompetitionViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, LeaguesDataDelegate,LeaguesDetailDelegate{
    func didUpdateDetailLeagues(leagues: [Leaguee]) {
        DispatchQueue.main.async {
            Model.leagueDetails = leagues
            self.tableView.reloadData()
        }
    }
    
    
    
    func didUpdateLeagues(leagues: [League]) {
        DispatchQueue.main.async {
            Model.leagues = leagues
            self.tableView.reloadData()
        }
    }
    var row:Int?
    var leagues = [League]()
    @IBOutlet weak var tableView: UITableView!
    var networkHandler=NetworkHandler()
    var leaguebadge = ""
    var currentLeague = [""]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        currentLeague.append(Model.leagues[indexPath.row].idLeague!)
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell") as! CompetitionTableViewCell
        
        cell.leagueName.text = Model.leagues[indexPath.row].strLeague
        for i in Model.leagueDetails{
            if i.strLeague == Model.leagues[indexPath.row].strLeague{
                leaguebadge = i.strBadge
                //cell.leagueBadge.sd_setImage(with: URL(string: i.strBadge!), placeholderImage:UIImage(named: "sports_icon"))
            }
            
        }
        cell.leagueView.layer.cornerRadius = 50
        cell.leagueBadge.layer.cornerRadius = 40
        cell.leagueBadge.sd_setImage(with: URL(string: leaguebadge), placeholderImage:UIImage(named: "sports_icon"))

       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row=indexPath.row
        //LeageViewController.strSport = Model.leagues[row!].idLeague!
        LeageViewController.currentId = Model.leagues[row!].idLeague!
        self.performSegue(withIdentifier: "showLeagueDetail", sender: (Any).self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLeagueDetails"{
           
            LeageViewController.currentId = Model.leagues[row!].idLeague!
            
        }
    }
    
    var sportType:String?;
    override func viewDidLoad() {
        super.viewDidLoad()
       
        networkHandler.leagueDelegate = self
        networkHandler.getAllLeagues(sportType: sportType ?? "Soccer")
        //networkHandler.getLeaguesDetails(ar: ["4346"])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
       
        // Do any additional setup after loading the view.
        
    }
    

    

}
