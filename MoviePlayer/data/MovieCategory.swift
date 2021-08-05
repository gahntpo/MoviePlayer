//
//  MovieCategory.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import Foundation


struct MovieCategory: Identifiable {
    
    let id: UUID = UUID()
    let title: String
    
    var movies: [Movie]

    static func example1() -> MovieCategory {
        var cat = MovieCategory(title: "Action", movies: [Movie]())
        cat.movies = [ Movie.example2(), Movie.example1(), Movie.example2(), Movie.example1()]
        return cat
    }
    
    static func example2() -> MovieCategory {
        var cat = MovieCategory(title: "Science Fiction", movies: [Movie]())
        cat.movies = [Movie.example1(), Movie.example2(), Movie.example1(),  Movie.example2()]
        return cat
    }
    
}
