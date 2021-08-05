//
//  PlaylistItemsPage.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import Foundation


struct PlaylistItemPage: Decodable {
    
    let nextPageToken: String
    let movies: [Movie]
    
   // let id: UUID = UUID()
    
    public enum CodingKeys: String, CodingKey {
        case nextPageToken
       case movies = "items"
        
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nextPageToken = try values.decode(String.self, forKey: .nextPageToken)
        movies = try values.decode([Movie].self, forKey: .movies)
    }
    
    
}



