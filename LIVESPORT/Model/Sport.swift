//
//  Sport.swift
//  LIVESPORT
//
//  Created by Home on 10/6/21.
//

import Foundation


struct Sports: Codable {
    let sports: [Sport]
}


struct Sport: Codable {
    let idSport:String?
    let strSport: String?
    let strSportThumb: String?
    let strFormat: String?
    
}
