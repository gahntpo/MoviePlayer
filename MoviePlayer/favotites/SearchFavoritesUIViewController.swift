//
//  SearchFavoritesUIViewController.swift
//  MoviePlayer
//
//  Created by Karin Prater on 07.08.21.
//

import UIKit

class SearchFavoritesUIViewController: UIViewController {

    var favorites: FavoritesManager!
    var selectedRowForMovie: (Movie) -> Void = { _ in }
    
    func updateMovies(for searchText: String, allMovies: [Movie]) {
        if searchText.count == 0 {
            filteredMovies = allMovies
        }else {
            filteredMovies = allMovies.filter({ $0.title.contains(searchText) })
        }
    }
    
    var filteredMovies = [Movie]() {
        didSet {
            resultsController.movies = filteredMovies
        }
    }
    
    
  let tableView = MovieTableView()
    let resultsController: MovieTableView!
    var searchController: UISearchController!
    
    init(favorites: FavoritesManager) {
        self.favorites = favorites
        self.resultsController = MovieTableView()
        self.searchController =  UISearchController(searchResultsController: resultsController)
       
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        searchController.searchBar.autocapitalizationType = .none
        
        resultsController.tableView.delegate = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        // Make the search bar always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        
        self.filteredMovies = favorites.movies
        
    }
    
    


}

extension SearchFavoritesUIViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = filteredMovies[indexPath.row]
        selectedRowForMovie(selectedMovie)
    }
}


extension SearchFavoritesUIViewController: UISearchControllerDelegate {
    
}

extension SearchFavoritesUIViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updateMovies(for: searchText, allMovies: favorites.movies)
    }
}
