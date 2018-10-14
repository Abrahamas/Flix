//
//  PopularMovieViewController.swift
//  Flix
//
//  Created by Mac on 7/22/1397 AP.
//  Copyright © 1397 Abraham Asmile. All rights reserved.
//

import UIKit

class PopularMovieViewController: UIViewController, UITableViewDataSource, UITabBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
     
    @IBOutlet weak var acIndicator: UIActivityIndicatorView!
    var data = [String]()
        var movies: [Movie] = []
        var refreshControl: UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if acIndicator.isAnimating == true
        {
            
            acIndicator.stopAnimating()
            acIndicator.isHidden = true
            
        }
        else {
            acIndicator.isHidden = false
            acIndicator.startAnimating()
            
        }
        
        
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullTorefresh(_:)) , for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        
        tableView.dataSource = self
        tableView.rowHeight = 150
        tableView.estimatedRowHeight = 200
        fetchMovies()
        
    }//
    @objc func didPullTorefresh (_ refreshControl: UIRefreshControl) {
        fetchMovies()
    }
    //https://api.themoviedb.org/3/movie/550
    func fetchMovies() {
        self.acIndicator.startAnimating()
        MovieApiManager().popularMovies { (movies: [Movie]?, error: Error?) in
           
            if let movies = movies {
                self.movies = movies
                self.acIndicator.stopAnimating()
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularCell", for: indexPath) as! PopularCell

        cell.movies = movies[indexPath.row]
        return cell
    }
 
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
