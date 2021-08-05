//
//  MovieRow.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

struct MovieRow: View {
    
    //TODO: - change to loading
    let image: UIImage?
    let title: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .shadow(radius: 10, x: 0, y: 10)
                
            }
            Text(title)
                .modifier(MovieCellStyle())
        } .padding()
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieRow(image: UIImage(named: "venom_thumbnail"), title: "Venom")
                
            MovieRow(image: UIImage(named: "affen_thumbnail"), title: "Planet der Affen: Prevolution")
        }
        .previewLayout(.fixed(width: 400, height: 300))
          
    }
}
