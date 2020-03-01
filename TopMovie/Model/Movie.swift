//
//  Movie.swift
//  TopMovie
//
//  Created by 黃士軒 on 2020/2/28.
//  Copyright © 2020 Lacie. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    let results: [MovieData]
    
    init(results: [MovieData]) {
        self.results = results
    }
}

struct MovieData: Decodable {
    
    let posterPath: String?
    let title: String?
    let overview: String?
    let releaseDate: String?
    
    init(posterPath: String, title: String, overview: String, releaseDate: String) {
        self.posterPath = posterPath
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
    }
}
