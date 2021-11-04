//
//  EventDetail.swift
//  LIVESPORT
//
//  Created by Home on 11/2/21.
//

import Foundation

struct EventDetails : Codable {
    let eventDetais : [EventDetail]
    //let results : [Event]
}
struct EventDetail : Codable {
    
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
    
}
