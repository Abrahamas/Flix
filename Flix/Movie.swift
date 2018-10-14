//
//  Movie.swift
//  Flix
//
//  Created by Mac on 7/22/1397 AP.
//  Copyright © 1397 Abraham Asmile. All rights reserved.
//

import Foundation
class Movie {
       //var movies: [Movie] = []
        var title: String
        var posterUrl: String?
       
        var overview: String?
      
        
        
        init(dictionary: [String: Any]) {
            title = dictionary["title"] as? String ?? "No title"
            
            // Set the rest of the properties
            posterUrl = dictionary["poster_path"] as? String
         
            overview = (dictionary["overview"] as? String)!
           
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

