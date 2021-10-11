//
//  LeagueDetail.swift
//  LIVESPORT
//
//  Created by Home on 10/9/21.
//

import Foundation

struct LeagueDetail: Codable {
    let leagues: [Leaguee]
}

// MARK: - League
struct Leaguee: Codable {
    let idLeague: String
    let strSport:String
    let strLeague: String
    let strYoutube: String
    let strBanner: String
    let strLogo: String
    let strNaming: String
    let strBadge:String
}
