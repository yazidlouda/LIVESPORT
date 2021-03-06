//
//  CountrySportViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/18/21.
//

import UIKit
import SDWebImage
class CountrySportViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, SportsDataDelegate{
    var row : Int?
    var country : String?
    var sportType : String?
    func didUpdateAllSports(allSports: Sports) {
        DispatchQueue.main.async {
            Model.sports = allSports.sports
            self.countrySportCollectionView.reloadData()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Model.sports.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        row = indexPath.row
        sportType = Model.sports[indexPath.row].strSport
        self.performSegue(withIdentifier: "showCountryLeague", sender: (Any).self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCountryLeague"{
            let vc = segue.destination as! CountryLeagueViewController
            
            vc.country = country!
            vc.sportType = sportType!
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countrySportCell", for: indexPath) as! CountrySportCollectionViewCell
        let sp = Model.sports[indexPath.row]
        cell.image.sd_setImage(with: URL(string: sp.strSportThumb!), placeholderImage:UIImage(named: "sports_icon"))
        cell.sportName.text = sp.strSport
        cell.layer.cornerRadius = 15
        cell.image.layer.cornerRadius = 15
        return cell
    }
    var networkHandler=NetworkHandler()

    @IBOutlet weak var countrySportCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        countrySportCollectionView.reloadData()
        networkHandler.delegate = self
        networkHandler.getAllSports()
        
        countrySportCollectionView.delegate = self
        countrySportCollectionView.dataSource = self
    }
    

   

}
