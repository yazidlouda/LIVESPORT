//
//  CountryViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/18/21.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CountriesDataDelegate{
    
    func didUpdateAllCountries(allCountries: Countries) {
        DispatchQueue.main.async {
            Model.countries = allCountries.countries
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.countries.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountryTableViewCell
        
        
        let sp = Model.countries[indexPath.row]
        cell.countryName.text = sp.name_en
        cell.countryView.layer.cornerRadius = 15

        return cell
    }
    
   
    
    var networkHandler=NetworkHandler()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        networkHandler.countriesDatadelegate = self
        networkHandler.getAllCountries()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      // sportType = Model.sports[indexPath.row].strSport;
       self.performSegue(withIdentifier: "showCountrySport", sender: self)
   }
  

  

}
