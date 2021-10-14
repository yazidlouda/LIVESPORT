//
//  Network.swift
//  LIVESPORT
//
//  Created by Home on 10/6/21.
//

import Foundation
import Alamofire

protocol SportsDataDelegate {
    func didUpdateAllSports(allSports : Sports)
}
protocol LeaguesDataDelegate {
    func didUpdateLeagues(leagues : [League])
}
protocol LeaguesDetailDelegate {
    func didUpdateDetailLeagues(leagues : [Leaguee])
}
protocol EventsDataDelegate {
    func didUpdateAllEvents(allEvents : [Event]);
}
protocol TeamsDataDelegate {
    func didUpdateTeama(teams : Teams);
}
protocol LatestEventsDelegate {
    func didUpdateEvents(events : [Result]?);
}

protocol GameEventDelegate {
    func didUpdateGameEvent(gameEvent: Result)
}
struct NetworkHandler{
    var delegate:SportsDataDelegate?
    var leagueDelegate:LeaguesDataDelegate?
    var eventsDataDelegate:EventsDataDelegate?
    var teamsDataDelegate:TeamsDataDelegate?
    var leaguedetailDelegate:LeaguesDetailDelegate?
    var latestEventDelegate:LatestEventsDelegate?
    var gameEventDelegate: GameEventDelegate?
    
    func getAllSports() {
        
        let urlString = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
        let request = AF.request(urlString)
        request.responseDecodable(of: Sports.self){ (response) in
            if let data = response.value{
                self.delegate?.didUpdateAllSports(allSports: data)
                
            }
        }
    }

    //sportType:String
    func getAllLeagues(sportType:String?){
        var arr = [String]()
        var arr1 : [League] = []
        let urlString = "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php"
        let request = AF.request(urlString)
        request.responseDecodable(of: Leagues.self){ (response) in
            if let data = response.value{
                for i in data.leagues
                {
                    if i.strSport == sportType{
                        arr.append(i.idLeague!)
                        arr1.append(i)
                    }
                    self.leagueDelegate?.didUpdateLeagues(leagues: arr1)
                }
                self.getLeaguesDetails(ar: arr);
            }
        }
    }
    func getLeaguesDetails(ar: [String]) {
        var arr = [Leaguee]()
        for id in ar{
            let urlString = "https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id=\(id)"
            let request = AF.request(urlString);
            request.responseDecodable(of: LeagueDetail.self){ (response) in
                if let data = response.value{
                    arr.append(data.leagues[0])
                    self.leaguedetailDelegate?.didUpdateDetailLeagues(leagues: arr)
                }
            }
        }
    }
   
    func getTeamsInLeague(leagueId: String) {

        
        let urlString = "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=\(leagueId)"
       // let replaced = urlString.replacingOccurrences(of: " ", with: "%20")

        let request = AF.request(urlString)
        request.responseDecodable(of: Teams.self){ (response) in
            if let data = response.value{

                self.teamsDataDelegate?.didUpdateTeama(teams: data)

            }

        }
        
    }
    
    func getAllEvent(leaueId : String){
        var arr : [Event] = []
        let urlString = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=\(leaueId)"
        let request = AF.request(urlString);
        request.responseDecodable(of: Events.self){ (response) in
            if let data = response.value{
                for i in data.events{
                    arr.append(i)
                }
                self.eventsDataDelegate?.didUpdateAllEvents(allEvents: arr)
                
                
            }
        }
    }

    func getLatestEventToTeam(teamId :String){
        let urlString = "https://www.thesportsdb.com/api/v1/json/1/eventslast.php?id=\(teamId)"
        let request = AF.request(urlString);
        request.responseDecodable(of: LatestEventForTeams.self){ (response) in
            if let data = response.value{
                self.latestEventDelegate?.didUpdateEvents(events: data.results)
            }
        }
    }
    func getGameEvent(eventId : String){
        
    }
}
