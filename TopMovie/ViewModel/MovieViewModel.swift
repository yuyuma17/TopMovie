//
//  MovieViewModel.swift
//  TopMovie
//
//  Created by 黃士軒 on 2020/2/28.
//  Copyright © 2020 Lacie. All rights reserved.
//

import Foundation

struct MovieViewModel {
    
    let posterPath: String?
    let title: String?
    let overview: String?
    let releaseDate: String?
    
    init(movieData: MovieData) {
        self.posterPath = movieData.posterPath
        self.title = movieData.title
        self.overview = movieData.overview
        self.releaseDate = movieData.releaseDate
    }
}
