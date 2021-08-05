//
//  PlaylistPage.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import Foundation

struct PlaylistPage: Decodable {
    
    let nextPageToken: String
    let playlists: [Playlist]
    
    public enum CodingKeys: String, CodingKey {
        case nextPageToken
       case playlists = "items"
        
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nextPageToken = try values.decode(String.self, forKey: .nextPageToken)
        playlists = try values.decode([Playlist].self, forKey: .playlists)
    }
    
    
}

struct Playlist: Decodable, Identifiable {
    let playlistId: String
    let snippet: Snippet
    
    var id: String {
        return playlistId
    }
    
    public enum CodingKeys: String, CodingKey {
     case playlistId
     case id
    case snippet
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let d = try values.decode( [String: String].self, forKey: .id)
        playlistId =  d["playlistId"] ?? ""
        snippet = try values.decode(Snippet.self, forKey: .snippet)

    }
}




struct Snippet: Decodable {
  
    let channelID: String
    let title: String
    let thumbnails: Thumbnails
   
    enum CodingKeys: String, CodingKey {
       
        case channelID = "channelId"
        case title
       case thumbnails
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    
        channelID = try values.decode(String.self, forKey: .channelID)
        title =  try values.decode(String.self, forKey: .title)
        thumbnails =  try values.decode(Thumbnails.self, forKey: .thumbnails)
     
    }
}

struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high: Thumbnail

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
    
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        thumbnailsDefault = try values.decode(Thumbnail.self, forKey: .thumbnailsDefault)
//        medium =  try values.decode(Thumbnail.self, forKey: .medium)
//        high =  try values.decode(Thumbnail.self, forKey: .high)
//    }
    
}


struct Thumbnail: Codable {
    let url: String
    let width: Int
    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case url
        case width, height
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    
        url = try values.decode(String.self, forKey: .url)
        width =  try values.decode(Int.self, forKey: .width)
        height =  try values.decode(Int.self, forKey: .height)
    }
}
