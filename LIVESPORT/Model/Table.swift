//
//  Table.swift
//  LIVESPORT
//
//  Created by Home on 11/3/21.
//

import Foundation


struct Table: Codable {
    let table: [Ranking]
}


struct Ranking: Codable {
    let idStanding:String?
    let intRank: String?
    let idTeam: String?
    let strTeam: String?
    let strTeamBadge:String?
    let idLeague: String?
    let strLeague: String?
    let strSeason: String?
    
    let strForm:String?
    let strDescription: String?
    let intPlayed: String?
    let intWin: String?
    let intLoss:String?
    let intDraw: String?
    let intGoalsFor: String?
    let intGoalsAgainst: String?
    let intGoalDifference: String?
    let intPoints: String?
    let dateUpdated: String?
}
