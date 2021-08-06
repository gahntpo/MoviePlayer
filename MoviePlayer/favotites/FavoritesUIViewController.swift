//
//  FavoritesUIViewController.swift
//  MoviePlayer
//
//  Created by Karin Prater on 06.08.21.
//

import UIKit
import Combine

class FavoritesUIViewController: UIViewController {

    
    enum Section {
        case main
    }
    
    var favorites: FavoritesManager!

    func updateMovies(for searchText: String, allMovies: [Movie]) {
        if searchText.count == 0 {
            filteredMovies = allMovies
        }else {
            filteredMovies = allMovies.filter({ $0.title.contains(searchText) })
        }
    }
    
    var filteredMovies = [Movie]() {
        didSet {
//            print("reload")
            tableView.reloadData()
        }
    }
    
    let searchBar = UISearchBar()
    var dataSource: UITableViewDiffableDataSource<Section, Movie>! = nil
    
    var tableView: UITableView!
    var subscriptions = Set<AnyCancellable>()
    
    init(favorites: FavoritesManager) {
        self.favorites = favorites
        filteredMovies = favorites.movies
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        configureTable()
        favorites.$movies.sink { [weak self] movies in
            self?.updateMovies(for: self?.searchBar.text ?? "", allMovies: movies)
        }.store(in: &subscriptions)
    }
    
    func configureTable() {

        tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableView.estimatedRowHeight = 200
    
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    

}


extension FavoritesUIViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredMovies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell,
              let index = indexPath.first else {
            fatalError("Cannot create new cell")
        }
        
     cell.configure()
        let movie = filteredMovies[indexPath.row]
        cell.movie = movie
        cell.titleLabel.text = movie.title
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        //TODO: push to detail
    }
    
}

extension FavoritesUIViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updateMovies(for: searchText, allMovies: favorites.movies)
    }
}
