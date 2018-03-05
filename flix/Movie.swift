//
//  Movie.swift
//  flix
//
//  Created by Jesus perez on 3/1/18.
//  Copyright © 2018 Jesus perez. All rights reserved.
//

import Foundation
class Movie {
    
    
    var title: String
    var overview: String
    var posterUrl: URL?
    var backdropUrl: URL?
    var moviePath :String
    var backdrop_path :String
     var releaseDate: String
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        moviePath = dictionary["poster_path"] as? String ?? "No movie path"
        posterUrl = URL(string: "https://image.tmdb.org/t/p/w500" + moviePath)
        backdrop_path = dictionary["backdrop_path"] as? String ?? "No backdrop"
        backdropUrl = URL(string: "https://image.tmdb.org/t/p/w500" + backdrop_path)
        releaseDate = dictionary["release_date"] as? String ?? "No date"
       
        
        
        // Set the rest of the properties
    }
    
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}


