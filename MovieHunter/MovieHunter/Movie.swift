//
//  Movie.swift
//  MovieHunter
//
//  Created by Jingxi Huang on 11/28/18.
//  Copyright © 2018 Jingxi Huang. All rights reserved.
//

import Foundation

@objc class Movie: NSObject {
    
    let name: String!
    let year: Int!
    let rated: String!
    let runtime: String!
    let genre: [String]!
    let director: String!
    let writer: String!
    let actors: String!
    let plot: String!
    let language: String!
    let awards: String!
//    let ratings: Int!
    let imageUrl: String!
    
    init(name: String, year: Int, rated: String, runtime: String, genre: [String], director: String, writer: String, actors: String, plot: String, language: String, awards: String, imageUrl: String) {
        self.name = name
        self.year = year
        self.rated = rated
        self.runtime = runtime
        self.genre = genre
        self.director = director
        self.writer = writer
        self.actors = actors
        self.plot = plot
        self.language = language
        self.awards = awards
//        self.ratings = ratings
        self.imageUrl = imageUrl
    }
    
    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.name == rhs.name
    }
    
}
