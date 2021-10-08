//
//  Network.swift
//  LIVESPORT
//
//  Created by Home on 10/6/21.
//

import Foundation
import Alamofire

protocol SportsDataDelegate {
    func didUpdateAllSports(allSports : Sports);
}

struct NetworkHandler{
    var delegate:SportsDataDelegate?;
   
    
    func getAllSports() {
        
        let urlString = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
        let request = AF.request(urlString)
        request.responseDecodable(of: Sports.self){ (response) in
            if let data = response.value{
                self.delegate?.didUpdateAllSports(allSports: data)
                
            }
        }
    }

   
   
   

   
}
