//
//  Event.swift
//  LIVESPORT
//
//  Created by Home on 10/9/21.
//

import Foundation

struct Events : Codable {
    let events : [Event]
    //let results : [Event]
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
    //let strCountry: String?
    //let strTimeLocal : String
}
