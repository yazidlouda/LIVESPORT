//
//  LastEvents.swift
//  LIVESPORT
//
//  Created by Home on 10/11/21.
//

import Foundation

struct LatestEventForTeams: Codable {
    let results : [Result]?
}

struct Result : Codable {
    
    let dateEvent : String
    let dateEventLocal : String?
    let idAPIfootball : String?
    let idAwayTeam : String?
    let idEvent : String?
    let idHomeTeam : String?
    let idLeague : String?
    let intAwayScore : String?
    let intHomeScore : String?
    let intRound : String?
    let strAwayGoalDetails : String?
    let strAwayTeam : String?
    let strCity : String?
    let strCountry : String?
    let strDescriptionEN : String?
    let strEvent : String?
    let strEventAlternate : String?
    let strFilename : String?
    let strHomeGoalDetails : String?
    let strHomeTeam : String?
    let strLeague : String?
    let strLocked : String?
    let strOfficial : String?
    let strPostponed : String?
    let strResult : String?
    let strSeason : String?
    let strSport : String?
    let strStatus : String?
    let strThumb : String?
    let strTime : String?
    let strTimeLocal : String?
    let strTimestamp : String?
    let strTweet1 : String?
    let strTweet2 : String?
    let strTweet3 : String?
    let strVenue : String?
    let strVideo : String?
}
