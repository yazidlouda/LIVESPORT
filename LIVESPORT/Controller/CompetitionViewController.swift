//
//  CompetitionViewController.swift
//  LIVESPORT
//
//  Created by Home on 10/6/21.
//

import UIKit

class CompetitionViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    var sportType:String?;
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = sportType
        // Do any additional setup after loading the view.
    }
    

    

}
