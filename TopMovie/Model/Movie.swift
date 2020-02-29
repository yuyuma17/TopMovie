//
//  Movie.swift
//  TopMovie
//
//  Created by 黃士軒 on 2020/2/28.
//  Copyright © 2020 Lacie. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let posterPath: String?
    let title: String?
    let overview: String?
    let releaseDate: String?
}
