//
//  LeagueInCountry.swift
//  LIVESPORT
//
//  Created by Home on 10/18/21.
//

import Foundation

struct LeagueInCountries: Codable {
    let leagueInCountries: [LeagueInCountry]
}


struct LeagueInCountry: Codable {
    let idLeague:String?
    let strLeague: String?
    let strCountry: String?
    let strFanart1: String?
    
}
