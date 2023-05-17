//
//  FilmModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 17.05.2023.
//

import Foundation

struct FilmModel: ResponseModelProtocol {
    let id: UUID = UUID()
    
    var imageType: ImageNameType {
        return .filmIcon
    }
    
    let name         : String
    let urlString    : String?
    
    let openingCrawl: String?
    let episodeId   : Int?
    let producer    : String?
    let releaseDate : String?
    let characters  : [String]?
    let planets     : [String]?
    let starships   : [String]?
    let species     : [String]?
    
    enum CodingKeys: String, CodingKey {
        case name            = "title"
        case urlString       = "url"
        
        case openingCrawl
        case producer
        case starships
        case species
        case planets
        case characters
        case episodeId      = "episode_id"
        case releaseDate    = "release_date"
    }
    
    var description: [String : Any] {
        return [
            "Name"          : name,
            "Opening crawl" : openingCrawl ?? "",
            "Producer"      : producer ?? "",
            "Episode id"    : episodeId ?? 1,
            "Release date"  : releaseDate ?? "",
            "Characters"    : characters ?? [],
            "Species"       : species ?? [],
            "Planets"       : planets ?? [],
            "Starships"     : starships ?? []
        ]
    }
}
