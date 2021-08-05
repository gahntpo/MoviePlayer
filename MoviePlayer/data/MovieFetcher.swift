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
    
    
    @Published var pages: [PlaylistPage] = []
    @Published var categories: [MovieCategory] = []
    
    @Published var isLoading: Bool = false
    @Published var error: String? = nil

    init() {
        
         fetchInitialPlaylistsPage()
    
    }
    
    
    func fetchInitialPlaylistsPage() {
        
        error = nil
        isLoading = true
        
        let searchPlaylistsPath = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=5&q=trailer&safeSearch=safeSearchSettingUnspecified&type=playlist&key=\(apiKey)"
    
        guard let url = URL(string: searchPlaylistsPath)  else {
            self.error = "Sorry we you could not get you data"
            return
        }

        let task =  URLSession.shared.dataTask(with: url) { [unowned self]  data, response, error in
            
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    print(error.localizedDescription)
                    self.error = error.localizedDescription
                    
                }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    print("bad status code \(response.statusCode)")
                    self.error = "Sorry something went wrong"
                }
                
                if let data = data {
                    do {
                        let decodedResult = try JSONDecoder().decode(PlaylistPage.self, from: data)
                        self.pages.append(decodedResult)
                        self.categories = decodedResult.categories //TODO: fetch more "categories"
                        
                        for list in decodedResult.categories {
                            self.fetchPlaylist(with: list.id)
                        }
                        
                    }catch {
                        print("decoding error  \(error)")
                        self.error = "Sorry something went wrong"
                    }
                    
                }
            }

        }
        task.resume()
    }
    
    
    func fetchPlaylist(with playlistID: String) {
        
        //  let playlistID = "PLBCF2DAC6FFB574DE"
        let playlistpath = "https://www.googleapis.com/youtube/v3/playlistItems?maxResults=15&part=snippet&playlistId=\(playlistID)&key=\(apiKey)"
        
        guard let url = URL(string: playlistpath)  else {
            self.error = "Sorry we you could not get you data"
            return
        }
        
        
        let task =  URLSession.shared.dataTask(with: url) { [unowned self]  data, response, error in

            DispatchQueue.main.async {
                if let error = error {
                    print("--- error fetching playlist")
                    print(error.localizedDescription)
                    self.error = error.localizedDescription
                    
                }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    print("playlist ---- bad status code \(response.statusCode)")
                    self.error = "Sorry something went wrong"
                }
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(PlaylistItemPage.self, from: data)
                        print("--- success")
                        print(result.movies.first)
                        
                        if let index =  self.categories.firstIndex(where: { $0.id == playlistID }) {
                            self.categories[index].movies = result.movies
                        }
                    }catch {
                        print("decoding error playlist item page --- \(error)")
                    }
                }

            
            }
                
            
        }
        
        task.resume()
    }
}
