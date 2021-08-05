//
//  MovieFetcher.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import Foundation
import Combine

class MovieFetcher: ObservableObject {
    
    
    let apiKey = Constants.key

    init() {
        
        let channel = "Apple"
        let path = "https://www.googleapis.com/youtube/v3/channels?part=contentDetails,snippet&forUsername=\(channel)&key=\(apiKey)"
        
        let playlistID = "PLBCF2DAC6FFB574DE"
        let playlistpath = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(playlistID)&key=\(apiKey)"

        let moviePath = "https://www.googleapis.com/youtube/v3/search?part=snippet&type=movie&key=\(apiKey)"
        
        let second = "https://www.googleapis.com/youtube/v3/search?q=trailer&videoCategoryId=30&type=video&key=\(apiKey)"
        
        let videoID = "w2GZwFRyM0w"
        let vidoePath = "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=\(videoID)&key=\(apiKey)"

            
        
        
        let url = URL(string: vidoePath)!
        
        
        print("init fetch -> \(path)")
        
        let request = URLRequest(url: url)
      //  request.httpMethod = "GET"
        
       // let session = URLSession
        
       
        let task =  URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                
            
            if let error = error {
                print(error.localizedDescription)
            }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                 print("bad status code \(response.statusCode)")
            }
                
                if let data = data,
                   let result = try? JSONSerialization.jsonObject(with: data, options: []){
                    print("got data")
                    
                    
                    print(result)
                    
                }
            }
            
           
        }
        task.resume()
    }
    
    
}
