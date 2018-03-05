//
//  NowPlayingViewController.swift
//  flix
//
//  Created by Jesus perez on 1/29/18.
//  Copyright © 2018 Jesus perez. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource{

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    //var movies : [[String: Any]] = []
    
    var movies: [Movie] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
         refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        
        tableView.dataSource = self
        // Do any additional setup after loading the view.
     
        fetchMovies()
        activityIndicator.stopAnimating()
    }
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchMovies()
    }
    
    func fetchMovies()
    {
        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
        
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movie = movies[indexPath.row]
        
        return cell
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailViewController
        let senderCell = sender as! MovieCell
        if let indexPath = tableView.indexPath(for: senderCell){
            vc.movie = movies[indexPath.row]
        }
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
