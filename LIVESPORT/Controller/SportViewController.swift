//
//  SportViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/6/21.
//

import UIKit
import SDWebImage



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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
  
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportCell") as! SportTableViewCell
       
        
        let sp = Model.sports[indexPath.row]
        cell.sportName.text = sp.strSport
        cell.sportImage.layer.cornerRadius = 15
        cell.sportView.layer.cornerRadius = 15
        for i in Model.sports{
            if i.strSport == sp.strSport{
                cell.sportImage.sd_setImage(with: URL(string: sp.strSportThumb!), placeholderImage:UIImage(named: "sports_icon"))
            }
        }
        
        return cell
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
