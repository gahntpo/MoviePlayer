//
//  ContentView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

enum TabSelection {
    case movies
    case favorites
    case settings
    
  
}

struct ContentView: View {
    
    @State private var selection: TabSelection = .movies
    
    @StateObject var favorties = FavoritesManager()
    //@StateObject var fetcher = MovieFetcher()
    
    
    var body: some View {
        
        TabView(selection: $selection) {
            MoviesView()
                .tabItem { Label("Movies", image: selection == .movies ? "MovieLight" : "MovieDisabled") }
                .tag(TabSelection.movies)
            
            FavoritesView()
                .tabItem { Label("Favorites", image: selection == .favorites ? "FavoritesLight" : "FavoritesDisabled") }
                .tag(TabSelection.favorites)
            
            SettingsView()
                .tabItem { Label("Settings", image: selection == .settings ? "SettingsLight" : "SettingsDisabled") }
                .tag(TabSelection.settings)
            
            
            
        }.environmentObject(favorties)
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
