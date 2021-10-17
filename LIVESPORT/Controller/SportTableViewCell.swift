//
//  SportTableViewCell.swift
//  LIVESPORT
//
//  Created by Home on 10/17/21.
//

import UIKit

class SportTableViewCell: UITableViewCell {

    @IBOutlet weak var sportView: UIView!
    @IBOutlet weak var sportName: UILabel!
    @IBOutlet weak var sportImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func viewDidLoad(){
        sportView.layer.cornerRadius = 15
    }
}
