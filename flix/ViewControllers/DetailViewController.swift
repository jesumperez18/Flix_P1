//
//  DetailViewController.swift
//  flix
//
//  Created by Jesus perez on 2/5/18.
//  Copyright © 2018 Jesus perez. All rights reserved.
//

import UIKit

enum MovieKeys{
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}


class DetailViewController: UIViewController {

   
   
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var backDropImageView: UIImageView!
    
    
     @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    //var movie :[String: Any]?
    
    
    
     var movie: Movie!
    
    // Setting our outlets for our attributes!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie{
//         titleLabel.text = movie[MovieKeys.title] as? String
//         releaseDateLabel.text = movie["release_date"] as? String
//         overviewLabel.text = movie["overview"] as? String
//            // Casting to a datatype we want with (!) ? research
//            let backdropPathString = movie[MovieKeys.backdropPath] as! String
//            let posterPathString = movie[MovieKeys.posterPath] as! String
//            let baseURLString = "https://image.tmdb.org/t/p/w500"
//            let backdropURL = URL(string: baseURLString + backdropPathString)!// (!) unwrapping
//            backDropImageView.af_setImage(withURL: backdropURL)
//            let posterPathUrl = URL(string: baseURLString + posterPathString)!// (!) unwrapping
//            posterImageView.af_setImage(withURL: posterPathUrl)
            
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDate
            overviewLabel.text = movie.overview
            backDropImageView.af_setImage(withURL: movie.backdropUrl!)
            posterImageView.af_setImage(withURL: movie.posterUrl!)
            
            
//
//
//
        }

        // Do any additional setup after loading the view.
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
