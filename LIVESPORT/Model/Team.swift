//
//  Team.swift
//  LIVESPORT
//
//  Created by Home on 10/9/21.
//

import Foundation

struct Teams : Codable {
    let teams : [Team]
}

struct Team : Codable {
    let idTeam : String?
    let idSoccerXML : String?
    let idAPIfootball : String?
    let strTeam : String?
    let strTeamShort : String?
    let strAlternate : String?
    let intFormedYear : String?
    let strSport : String?
    let strLeague : String?
    let idLeague : String?
    let strLeague2 : String?
    let strLeague3 : String?
    let strLeague4 : String?
    let strLeague5 : String?
    let strLeague6 : String?
    let strLeague7 : String?
    let strGender : String?
    let strCountry : String?
    let strManager : String?
    let strKeywords : String?
    let strLocked : String?
    let strRSS : String?
    let strTeamBadge : String?
    let strTeamBanner : String?
    let strTeamFanart1 : String?
    let strTeamJersey : String?
    let strTeamLogo : String?
    let strYoutube : String?
}
