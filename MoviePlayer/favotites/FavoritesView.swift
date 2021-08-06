//
//  FavoritesView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favorites: FavoritesManager
    
    @State private var searchText: String = ""
    
    var filteredMovies: [Movie] {
        if searchText.count == 0 {
            return favorites.movies
        }else {
            return favorites.movies.filter({ $0.title.contains(searchText) })
        }
    }
    
    var body: some View {
        
        NavigationView {
        WrapperFavoritesViewController(favorites: favorites)
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
//        VStack {
//            Text("Favorites")
//                .font(.headline)
//
//            HStack {
//                Image(systemName: "magnifyingglass")
//                    .foregroundColor(.gray)
//
//                TextField("Search", text: $searchText.animation())
//
//                if searchText.count > 0 {
//                    Button(action: {
//                        searchText = ""
//                    }, label: {
//                        Image(systemName: "xmark.circle")
//                    })
//                }
//
//            }//.border(Color.black)
//            .padding(5)
//            .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
//            .padding()
//
//            List {
//
//                //TODO: - check if sorted by category
//                ForEach(filteredMovies) { movie in
//                    MovieLoadRow(movie: movie)
//
//                }
//                .listRowInsets(.init(top: 0, leading: 0, bottom: -0, trailing: 0))
//
//            }
//        }
    }
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
       
        let manager = FavoritesManager()
        manager.movies = [Movie.example1(), Movie.example2()]
        
        return FavoritesView()
            .environmentObject(manager)
            
    }
}
