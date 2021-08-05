//
//  MovieLoadCard.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import SwiftUI

struct MovieLoadCard: View {
    let movie: Movie
    
    @StateObject private var posterLoader: ImageLoader
   
    init(movie: Movie) {
        self.movie = movie
        let load = ImageLoader()
        load.load(url: movie.posterImageURL)
        self._posterLoader = StateObject(wrappedValue: load)
    }
    
    var body: some View {
        
        MovieCard(image: posterLoader.image, title: movie.title)
    }
}

struct MovieLoadCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieLoadCard(movie:  Movie.example2())
    }
}
