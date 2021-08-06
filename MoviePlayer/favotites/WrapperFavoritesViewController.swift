//
//  WrapperFavoritesViewController.swift
//  MoviePlayer
//
//  Created by Karin Prater on 06.08.21.
//

import SwiftUI

struct WrapperFavoritesViewController: UIViewControllerRepresentable {
    
    let favorites: FavoritesManager
    
    func makeUIViewController(context: Context) -> FavoritesUIViewController {
        let controller = FavoritesUIViewController(favorites: favorites)
      
        return controller
    }
    
    func updateUIViewController(_ uiViewController: FavoritesUIViewController, context: Context) {
        
    }

   
    
}

struct WrapperFavoritesViewController_Previews: PreviewProvider {
    static var previews: some View {
        WrapperFavoritesViewController(favorites: FavoritesManager.example())
    }
}
