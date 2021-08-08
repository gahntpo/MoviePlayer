//
//  ResultsMovieViewController.swift
//  MoviePlayer
//
//  Created by Karin Prater on 07.08.21.
//

import UIKit

class MovieTableView: UITableViewController {

    enum Section {
        case main
    }
    
    var movies: [Movie] = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    

  
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("reload with \(movies.count)")
        tableView.reloadData()
    }
    

    func configureTable() {

//        tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(tableView)
//
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//
        tableView.estimatedRowHeight = 200
        tableView.separatorStyle = .none
    
//        tableView.dataSource = self
     
    }
    

  override  func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
            fatalError("Cannot create new cell")
        }
    
        let movie = movies[indexPath.row]
        cell.movie = movie
        cell.titleLabel.text = movie.title
        cell.configure()
        return cell
    }
}
