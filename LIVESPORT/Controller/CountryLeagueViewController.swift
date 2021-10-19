//
//  CountryLeagueViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/18/21.
//

import UIKit
import SDWebImage

class CountryLeagueViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LeaguesDataDelegate,LeaguesDetailDelegate,LeagueInCountriesDataDelegate {
    
    var networkHandler = NetworkHandler()
    var sportType = "Soccer"
    var arr: [String] = []
    var leaguess = Set<Leaguee>()
    
    var country = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for i in Model.leagueDetails{
            if i.strCountry == country{
                leaguess.insert(i)
            }
        }
        return leaguess.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryLeagueCell") as! CountryLeagueTableViewCell
        let arr = Array(leaguess)
        cell.leagueName.text = arr[indexPath.row].strLeague
        cell.leagueImage.sd_setImage(with: URL(string: arr[indexPath.row].strBadge), placeholderImage:UIImage(named: "sports_icon"))
        cell.leagueView.layer.cornerRadius = 15
        cell.leagueImage.layer.cornerRadius = 15
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
   
    
    func didUpdateLeagues(leagues: [League]) {
        DispatchQueue.main.async {
            
            Model.leagues = leagues
            self.tableView.reloadData()
        }
    }
    
    func didUpdateDetailLeagues(leagues: [Leaguee]) {
        DispatchQueue.main.async {
//            for i in leagues{
//                if i.strCountry == "England"{
//                    self.leaguess.append(i)
//                }
//            }
            Model.leagueDetails = leagues
            self.tableView.reloadData()
        }
    }
    
    func didUpdateAllLeagueInCountries(allCountries: LeagueInCountries) {
        DispatchQueue.main.async {
            Model.leagueInCountries = allCountries.leagueInCountries
            self.tableView.reloadData()
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkHandler.leagueDelegate = self
        networkHandler.leaguedetailDelegate = self
        networkHandler.getAllLeagues(sportType: sportType )
        
        networkHandler.getLeaguesDetails(ar: arr)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }
    

    
}
