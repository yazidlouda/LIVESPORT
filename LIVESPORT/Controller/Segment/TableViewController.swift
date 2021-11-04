//
//  TableViewController.swift
//  LIVESPORT
//
//  Created by Home on 11/4/21.
//

import UIKit
import SDWebImage
class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate  , TableDelegate{

    @IBOutlet weak var tableView: UITableView!
    var networkHandler = NetworkHandler()
    static var currentEvent : Event?
    func didUpdateTable(ranking: [Ranking]) {
        DispatchQueue.main.async {
            Model.tables = ranking
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.tables.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test") as! TestTableViewCell
        cell.teamName.text = Model.tables[indexPath.row].strTeam
        cell.gamePlayed.text = Model.tables[indexPath.row].intPlayed
        cell.goalDifference.text = Model.tables[indexPath.row].intGoalDifference
        cell.points.text = Model.tables[indexPath.row].intPoints
        cell.rankingNumber.text = Model.tables[indexPath.row].intRank
        cell.teamLogo.sd_setImage(with: URL(string: Model.tables[indexPath.row].strTeamBadge!), placeholderImage:UIImage(named: "sports_icon"))
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        networkHandler.tableDelegate = self
        networkHandler.getTable(leagueId: TableViewController.currentEvent!.idLeague)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
    }
    

   

}
