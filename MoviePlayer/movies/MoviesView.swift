//
//  MoviesView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

enum DisplayStyle: String, CaseIterable {
    case grid = "Grid"
    case list = "List"
}


struct MoviesView: View {
    
    @State private var displayStyle = DisplayStyle.list
    @StateObject var fetcher: MovieFetcher
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Picker("", selection: $displayStyle) {
                    
                    Text("Grid")
                        .tag(DisplayStyle.grid)
                    Text("List")
                        .tag(DisplayStyle.list)
                }.pickerStyle(SegmentedPickerStyle())
                .padding()
                
                
                
                switch displayStyle {
                case .list: ListMovieView(categories: fetcher.categories)
                case .grid: GridMovieView(categories: fetcher.categories)
                }
                
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(fetcher: MovieFetcher())
    }
}
