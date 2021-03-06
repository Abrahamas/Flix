//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Mac on 6/24/1397 AP.
//  Copyright © 1397 Abraham Asmile. All rights reserved.
//
import AlamofireImage
import UIKit


class NowPlayingViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var acIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
   var movies: [Movie] = []
        var data = [String]()
    //var movies: [[String: Any]] = []
    var refreshControl: UIRefreshControl!
   // var movies: [Movie] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Start the activity indicator
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
            MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in

                    self.acIndicator.startAnimating()
              if let movies = movies {
                self.movies = movies
                self.acIndicator.stopAnimating()
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
        //task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

           cell.movies = movies[indexPath.row]
        return cell
    }

        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

}


