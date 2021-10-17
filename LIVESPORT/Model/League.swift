//
//  League.swift
//  LIVESPORT
//
//  Created by Home on 10/8/21.
//

import Foundation

struct Leagues: Codable {
    let leagues: [League]
}


struct League: Codable {
    let idLeague:String?
    let strLeague: String?
    let strSport: String?
    let strBadge: String?
    
}
