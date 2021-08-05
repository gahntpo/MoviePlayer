//
//  MoviewCard.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

struct MovieCard: View {
    let image: UIImage?
    let title: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .shadow(radius: 10, x: 0, y: 10)
                
            }
            Text(title)
                .multilineTextAlignment(.leading)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
        } .padding()
        .frame(width: 200)
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieCard(image: UIImage(named: "venom_movieposter"), title: "Venom")
            MovieCard(image: UIImage(named: "affen_movieposter"), title: "Planet der Affen: Prevolution")
        }
        .previewLayout(.fixed(width: 400, height: 400))
    }
}
