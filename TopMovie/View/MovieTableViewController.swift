//
//  MovieTableViewController.swift
//  TopMovie
//
//  Created by 黃士軒 on 2020/2/29.
//  Copyright © 2020 Lacie. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    fileprivate var movieViewModel = [MovieViewModel]()
    fileprivate let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavBar()
        fetchData()
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchMovies { (movies, error) in
            if error == nil {
                self.movieViewModel = movies?.map({ return MovieViewModel(movieData: $0)}) ?? []
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movieViewModel.count
    }
    
    // to do
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = movieViewModel[indexPath.row].title ?? ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    fileprivate func setupTableView() {
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        tableView.separatorColor = .black
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Top 20 Popular Movies In 2020"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
}
