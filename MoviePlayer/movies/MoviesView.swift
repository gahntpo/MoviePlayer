//
//  MoviesView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

struct MoviesView: View {
    
    let firstMovies = [Movie.example1(), Movie.example2()]
    let secondMovies = [Movie.example1(), Movie.example1(), Movie.example2()]
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(firstMovies) { movie in
                    Text(movie.title)
                }
            }
            
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
