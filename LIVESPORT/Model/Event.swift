//
//  Event.swift
//  LIVESPORT
//
//  Created by Home on 10/9/21.
//

import Foundation

struct Events : Codable {
    let events : [Event]
    
}
struct Event : Codable {
    
    let dateEvent : String?
    let idEvent : String?
    let idLeague : String?
    let intAwayScore : String?
    let intHomeScore : String?
    let strAwayTeam : String?
    let strEvent : String?
    let strHomeTeam : String?
    let strLeague : String?
    let strSeason : String?
    let strSport : String?
    let strTime : String?
    let strHomeLineupGoalkeeper: String?
    let strHomeLineupDefense: String?
    let strHomeLineupMidfield: String?
    let strHomeLineupForward: String?
    let strHomeLineupSubstitutes: String?
    let strDescriptionEN: String?
    let strThumb: String?
    let strStatus: String?
    let strPostponed: String?
}
