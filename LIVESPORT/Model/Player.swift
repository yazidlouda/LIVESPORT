//
//  Player.swift
//  LIVESPORT
//
//  Created by Home on 10/11/21.
//

import Foundation
struct Players: Codable{
    let players : [Player]?
}
struct Player : Codable{
    let idPlayer: String?
    let idTeam : String?
    let idSoccerXML: String?
    let idAPIfootball: String?
    let idPlayerManager: String?
    let strNationality: String?
    let strPlayer: String?
    let strTeam: String?
    let strTeam2: String?
    let strSport: String?
    let intSoccerXMLTeamID: String?
    let dateBorn: String?
    let strNumber: String?
    let dateSigned: String?
    let strBirthLocation: String?
    let strDescriptionEN: String?
    let strGender: String?
    let strPosition: String?
    let strWeight: String?
    let strHeight: String?
}
