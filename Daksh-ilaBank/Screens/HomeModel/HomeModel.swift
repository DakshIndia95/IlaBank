//
//  SportsModel.swift
//  Daksh-ilaBank
//
//  Created by Neosoft on 04/07/23.
//

import Foundation

struct HomeModel : Codable{
    let data: [HomeSportsData]?
}

struct HomeSportsData : Codable{
    let sportsName : String?
    let logo : String?
    var teams : [TeamsData]?
}

struct TeamsData : Codable{
    let name : String
    let logo : String?
}
