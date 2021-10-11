//
//  Team.swift
//  LIVESPORT
//
//  Created by Home on 10/9/21.
//

import Foundation

struct Teams : Codable {
    let teams : [Team]?
}

struct Team : Codable {
    let idAPIfootball : String?
    let idLeague : String?
    let idSoccerXML : String?
    let idTeam : String?
    let intFormedYear : String?
    let intStadiumCapacity : String?
    let strAlternate : String?
    let strCountry : String?
    let strFacebook : String?
    let strGender : String?
    let strInstagram : String?
    let strKeywords : String?
    let strLeague : String?
    let strLeague2 : String?
    let strLeague3 : String?
    let strLeague4 : String?
    let strLeague5 : String?
    let strLeague6 : String?
    let strLeague7 : String?
    let strLocked : String?
    let strManager : String?
    let strRSS : String?
    let strSport : String?
    let strStadium : String?
    let strStadiumDescription : String?
    let strStadiumLocation : String?
    let strStadiumThumb : String?
    let strTeam : String?
    let strTeamBadge : String?
    let strTeamBanner : String?
    let strTeamFanart1 : String?
    let strTeamJersey : String?
    let strTeamLogo : String?
    let strTwitter : String?
    let strWebsite : String?
    let strYoutube : String?
}
