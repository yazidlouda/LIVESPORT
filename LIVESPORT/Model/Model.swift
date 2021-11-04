//
//  Model.swift
//  LIVESPORT
//
//  Created by Home on 10/6/21.
//

import Foundation

class Model{
    
    static var sports:[Sport] = [Sport]()
    static var leagues:[League] = [League]()
    static var leagueDetails: [Leaguee] = [Leaguee]()
    static var events = [Event]()
    static var latestEvents = [Result]()
    static var teams :[Team] = [Team]()
    static var eventDetails = [EventDetail]()
    static var currentLeague:Leaguee?
    static var countries: [Country] = [Country]()
    static var leagueInCountries: [LeagueInCountry] = [LeagueInCountry]()
    static var tables: [Ranking] = [Ranking]()
}
