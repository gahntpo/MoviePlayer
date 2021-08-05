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
    
    @State private var movieCategories = [MovieCategory.example1(), MovieCategory.example2(), MovieCategory.example1()]
    
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
                case .list: ListMovieView(categories: movieCategories)
                case .grid: GridMovieView(categories: movieCategories)
                }
                
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
