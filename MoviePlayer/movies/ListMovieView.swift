//
//  ListMovieView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import SwiftUI

struct ListMovieView: View {
    
    let firstMovies = [Movie.example1(), Movie.example2()]
    let secondMovies = [Movie.example1(), Movie.example1(), Movie.example2()]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ListMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ListMovieView()
    }
}
