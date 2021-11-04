//
//  TestViewController.swift
//  LIVESPORT
//
//  Created by Home on 11/3/21.
//

import UIKit

class TestViewController: UIViewController,UITableViewDataSource,UITableViewDelegate , TableDelegate{
    @IBOutlet weak var tableView: UITableView!
    var networkHandler = NetworkHandler()
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
        cell.textLabel!.text = Model.tables[indexPath.row].strTeam
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        networkHandler.tableDelegate = self
        networkHandler.getTable(leagueId: "4328")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    

    

}
