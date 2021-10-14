//
//  CompetitionViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/6/21.
//

import UIKit

class CompetitionViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, LeaguesDataDelegate{
    
    
    func didUpdateLeagues(leagues: [League]) {
        DispatchQueue.main.async {
            Model.leagues = leagues
            self.tableView.reloadData();
        }
    }
    var row:Int?
    var leagues = [League]()
    @IBOutlet weak var tableView: UITableView!
    var networkHandler=NetworkHandler()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "leaguecell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "leaguecell")
        }
        
        let leagueData = Model.leagues[indexPath.row]
        
        
       cell?.textLabel?.text = leagueData.strLeague ?? "nothing"
        cell?.detailTextLabel?.text = leagueData.strLeague ?? "no league"
       
        return cell!
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row=indexPath.row
        //LeageViewController.strSport = Model.leagues[row!].idLeague!
        LeageViewController.currentId = Model.leagues[row!].idLeague!
        self.performSegue(withIdentifier: "showLeagueDetail", sender: (Any).self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLeagueDetails"{
           // let vc = segue.destination as! LeageViewController;
            //vc.currentLeague = Model.leagues[row!]
            //LeageViewController.strSport = Model.leagues[row!].idLeague!
            LeageViewController.currentId = Model.leagues[row!].idLeague!
            
        }
    }
    
    var sportType:String?;
    override func viewDidLoad() {
        super.viewDidLoad()
        networkHandler.leagueDelegate = self
        networkHandler.getAllLeagues(sportType: sportType ?? "Soccer")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    

    

}
