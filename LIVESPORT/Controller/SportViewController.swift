//
//  SportViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/6/21.
//

import UIKit
import SDWebImage


private let reuseIdentifier = "sportCell"
class SportViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SportsDataDelegate {
    
    func didUpdateAllSports(allSports: Sports) {
        DispatchQueue.main.async {
            Model.sports = allSports.sports
            self.tableView.reloadData()
        }
    }
    
   
    @IBOutlet weak var tableView: UITableView!
    var networkHandler=NetworkHandler()
    var sportType:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkHandler.delegate = self
        networkHandler.getAllSports()
       // networkHandler.getTeamsInLeague(leagueId: "4328")
      
        tableView.delegate = self
        tableView.dataSource = self
        
       
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Model.sports.count
    }

  
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "countrycell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "countrycell")
        }
        
        let sp = Model.sports[indexPath.row]
       cell?.textLabel?.text = sp.strSport ?? "nothing"
        cell?.detailTextLabel?.text = sp.strSport ?? "no sport"
        return cell!
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sportType = Model.sports[indexPath.row].strSport;
        self.performSegue(withIdentifier: "showLeague", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLeague"{
            let destination = segue.destination as! CompetitionViewController;
            destination.sportType = sportType;
        }
    }

}
