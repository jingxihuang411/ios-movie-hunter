//
//  MovieGenerator.swift
//  MovieHunter
//
//  Created by Jingxi Huang on 11/28/18.
//  Copyright © 2018 Jingxi Huang. All rights reserved.
//

import Foundation

class MovieGenerator {
    
    static let categoryDict: [Int:String] =
        [
            0: "Action",
            1: "Adventure",
            2: "Animation",
            3: "Comedy",
            4: "Fantasy",
            5: "History",
            6: "Horror",
            7: "Musical",
            8: "Romantic",
            9: "War"
    ]
    
    static func getMovieArray() -> [Movie] {
        var movieArray: [Movie] = []
        if let path = Bundle.main.path(forResource: "movieData", ofType: "json")
        {
            if let jsonData = NSData(contentsOfFile: path) {
                do {
                    let json = try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) as! [String:AnyObject]
                    let movieList = json["movieList"] as! [AnyObject]
                    for movieData in movieList {
                        let name = movieData["Title"] as! String
                        let year = Int(movieData["Year"] as! String)!
                        let rated = movieData["Rated"] as! String
                        let runtime = movieData["Runtime"] as! String
                        
                        let str = movieData["Genre"] as! String
                        let genre = str.components(separatedBy: ", ")
                        
                        let director = movieData["Director"] as! String
                        let writer = movieData["Writer"] as! String
                        let actors = movieData["Actors"] as! String
                        let plot = movieData["Plot"] as! String
                        let language = movieData["Language"] as! String
                        let awards = movieData["Awards"] as! String
//                        let ratings = Int(movieData["imdbRating"]! as! String)!
                        let imageUrl = movieData["Poster"] as! String
                        movieArray.append(Movie(name: name, year: year, rated: rated, runtime: runtime, genre: genre, director: director, writer: writer, actors: actors, plot: plot, language: language, awards: awards, imageUrl: imageUrl))
                    }
                } catch {
                    NSLog("Could not load movie array")
                }
                
            }
        }
        return movieArray
    }
    
static func getTopMovie() -> [Movie] {
        var movieArray: [Movie] = []
        if let path = Bundle.main.path(forResource: "topMovie", ofType: "json")
        {
            if let jsonData = NSData(contentsOfFile: path) {
                do {
                    let json = try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) as! [String:AnyObject]
                    let movieList = json["movieList"] as! [AnyObject]
                    for movieData in movieList {
                        let name = movieData["Title"] as! String
                        let year = Int(movieData["Year"] as! String)!
                        let rated = movieData["Rated"] as! String
                        let runtime = movieData["Runtime"] as! String
                        
                        let str = movieData["Genre"] as! String
                        let genre = str.components(separatedBy: ", ")
                        
                        let director = movieData["Director"] as! String
                        let writer = movieData["Writer"] as! String
                        let actors = movieData["Actors"] as! String
                        let plot = movieData["Plot"] as! String
                        let language = movieData["Language"] as! String
                        let awards = movieData["Awards"] as! String
                        let imageUrl = movieData["Poster"] as! String
                        movieArray.append(Movie(name: name, year: year, rated: rated, runtime: runtime, genre: genre, director: director, writer: writer, actors: actors, plot: plot, language: language, awards: awards, imageUrl: imageUrl))
                    }
                } catch {
                    NSLog("Could not load movie array")
                }
                
            }
        }
        return movieArray
    }
    
    
}
