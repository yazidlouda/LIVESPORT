//
//  Country.swift
//  LIVESPORT
//
//  Created by Home on 10/18/21.
//

import Foundation

struct Countries: Codable {
    let countries: [Country]
}


struct Country: Codable {
    let name_en: String?
   
    
}
