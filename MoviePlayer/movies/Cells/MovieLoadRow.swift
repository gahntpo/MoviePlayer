//
//  MovieLoadRow.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import SwiftUI

struct MovieLoadRow: View {
    
    let movie: Movie
    
    @StateObject private var headerLoader: ImageLoader
   
    init(movie: Movie) {
        self.movie = movie
        let load = ImageLoader()
        load.load(url: movie.headerImageURL)
        self._headerLoader = StateObject(wrappedValue: load)
    }
    
    var body: some View {
        MovieRow(image: headerLoader.image, title: movie.title)
        
    }
}

struct MovieLoadRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieLoadRow(movie: Movie.example1())
    }
}
