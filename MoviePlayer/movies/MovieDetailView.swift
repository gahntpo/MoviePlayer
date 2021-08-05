//
//  FavoriteDetailView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    @StateObject private var posterLoader: ImageLoader
    @StateObject private var headerLoader: ImageLoader
    
    init(movie: Movie) {
        self.movie = movie
        let load = ImageLoader()
        load.load(url: movie.posterImageURL)
        self._posterLoader = StateObject(wrappedValue: load)
        
        let headerload = ImageLoader()
        headerload.load(url: movie.headerImageURL)
        self._headerLoader = StateObject(wrappedValue: headerload)
        
    }
    
    let starColor: Color = .red
    let posterImageHeight: CGFloat = 200
    
    var body: some View {
        
        VStack {
            
           
            if posterLoader.image != nil {
                Image(uiImage: headerLoader.image!)
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: posterImageHeight * 2)
                    .clipped()
                    
            }else {
                Color.gray.frame(height: 300)
            }
                    
            
            
            HStack(alignment: .top, spacing: 15) {
                if posterLoader.image != nil {
                    Image(uiImage: posterLoader.image!)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: posterImageHeight)
                        .shadow(color: .black, radius: 10, x: 0, y: 10)
                    
                }else {
                    Color.black.frame(width: posterImageHeight / 3 * 2, height: posterImageHeight)
                }
                
                VStack(alignment: .leading) {
                
                    Text(movie.title)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    
                    Text("\(movie.numberOfPeopleWatching) People watching")
                        .font(.subheadline)
                    Text(movie.categories.reduce("", { all, next in
                        all + next + " "
                    }))
                    .font(.subheadline)
                    
                    HStack(spacing: 2) {
                        
                        Text(String(format: "%.1f", movie.rating))
                            .foregroundColor(starColor).padding(.trailing, 2)
                        ForEach(0..<5, id: \.self) { star in
                            Image(systemName: "star.fill").foregroundColor(star < Int(movie.rating) ? starColor : Color(.systemGray))
                            
                        }
                    }.padding(.vertical)
                    
                }
                
            }.offset(x: 0, y: -posterImageHeight * 0.4 )
            .padding(.bottom, -posterImageHeight * 0.4)
            .padding(.bottom)
            ScrollView {
                Text(movie.description)
                    .font(.body)
            }.padding([.top, .horizontal])
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.example1())
    }
}