//
//  PlaylistPage.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import Foundation

struct PlaylistPage: Decodable {
    
    let nextPageToken: String
    let categories: [MovieCategory]
    
    public enum CodingKeys: String, CodingKey {
        case nextPageToken
       case categories = "items"
        
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nextPageToken = try values.decode(String.self, forKey: .nextPageToken)
        categories = try values.decode([MovieCategory].self, forKey: .categories)
    }
    
    
}

//struct Playlist: Decodable, Identifiable {
//    let playlistId: String
//    let snippet: Snippet
//
//    var movies: [Movie] = [Movie]()
//
//    var title: String {
//        snippet.title
//    }
//
//    var id: String {
//        return playlistId
//    }
//
//    public enum CodingKeys: String, CodingKey {
//     case playlistId
//     case id
//    case snippet
//    }
//
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        let d = try values.decode( [String: String].self, forKey: .id)
//        playlistId =  d["playlistId"] ?? ""
//        snippet = try values.decode(Snippet.self, forKey: .snippet)
//
//    }
//}




