//
//  CountryViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/18/21.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CountriesDataDelegate,UISearchBarDelegate,LeaguesDetailDelegate{
    func didUpdateDetailLeagues(leagues: [Leaguee]) {
        DispatchQueue.main.async {
            Model.leagueDetails = leagues
            self.tableView.reloadData()
        }
    }
    
    var row : Int?
    var filteredData:[Country] = []
    var countrie: [Country]?
    var league: [Leaguee] = []
    @IBOutlet weak var countrySearchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        networkHandler.countriesDatadelegate = self
        networkHandler.getAllCountries()
       
        tableView.delegate = self
        tableView.dataSource = self
        
        
        filteredData.sort(by: { $0.name_en! < $1.name_en! })
        
        
    }
    func didUpdateAllCountries(allCountries: Countries) {
        DispatchQueue.main.async {
            Model.countries = allCountries.countries
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            for i in Model.countries{
                
                    filteredData.append(i)
                
                
            
        }
        
        filteredData.sort(by: { $0.name_en! < $1.name_en! })
        
        return filteredData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountryTableViewCell
        
        
        let sp = filteredData[indexPath.row]
        cell.countryName.text = sp.name_en
        cell.countryView.layer.cornerRadius = 15

        return cell
    }
   
   
    
    var networkHandler=NetworkHandler()
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
       self.performSegue(withIdentifier: "showCountrySport", sender: self)
   }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCountrySport"{
            let vc = segue.destination as! CountrySportViewController
            
            vc.country = filteredData[row!].name_en
            
            
        }
    }

   
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == "" {
            filteredData = Model.countries

            tableView.reloadData()
        }else{
            for db in Model.countries {
                let name = db.name_en!
                if (name.lowercased().contains(searchText.lowercased())){
                    filteredData.append(db)

                    tableView.reloadData()
                }
            }
        }
        self.tableView.reloadData()

    }
}

