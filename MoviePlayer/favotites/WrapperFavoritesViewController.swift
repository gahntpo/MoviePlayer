//
//  WrapperFavoritesViewController.swift
//  MoviePlayer
//
//  Created by Karin Prater on 06.08.21.
//

import SwiftUI

struct WrapperFavoritesViewController: UIViewControllerRepresentable {
    
    let favorites: FavoritesManager
    
    @Binding var selectedMovie: Movie?
    
    
//    func makeUIViewController(context: Context) -> SearchFavoritesUIViewController {
//        let controller = SearchFavoritesUIViewController(favorites: favorites)
//      
//        controller.selectedRowForMovie = { movie in
//            self.selectedMovie = movie
//        }
//        return controller
//    }
//    
//    func updateUIViewController(_ uiViewController: SearchFavoritesUIViewController, context: Context) {
//        
//        if selectedMovie == nil {
//            uiViewController.resultsController.tableView.deselectSelectedRow(animated: true)
//        }
//    }
    
    func makeUIViewController(context: Context) -> FavoritesUIViewController {
        let controller = FavoritesUIViewController(favorites: favorites)

        controller.selectedRowForMovie = { movie in
            self.selectedMovie = movie
        }
        return controller
    }

    func updateUIViewController(_ uiViewController: FavoritesUIViewController, context: Context) {

        if selectedMovie == nil {
            uiViewController.tableView.deselectSelectedRow(animated: true)
        }
    }

}

struct WrapperFavoritesViewController_Previews: PreviewProvider {
    static var previews: some View {
        WrapperFavoritesViewController(favorites: FavoritesManager.example(), selectedMovie: .constant(nil))
    }
}
