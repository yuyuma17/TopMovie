//
//  TopMovieTests.swift
//  TopMovieTests
//
//  Created by 黃士軒 on 2020/2/28.
//  Copyright © 2020 Lacie. All rights reserved.
//

import XCTest
@testable import TopMovie

class TopMovieTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMovieViewModel() {
        let movieData = MovieData(posterPath: "/aQvJ5WPzZgYVDrxLX4R6cLJCEaQ.jpg", title: "Sonic the Hedgehog", overview: "Based on the global blockbuster videogame franchise from Sega, Sonic the Hedgehog tells the story of the world’s speediest hedgehog as he embraces his new home on Earth. In this live-action adventure comedy, Sonic and his new best friend team up to defend the planet from the evil genius Dr. Robotnik and his plans for world domination.", releaseDate: "2020-02-12")
        let movieViewModel = MovieViewModel(movieData: movieData)
        
        XCTAssertEqual(movieData.title, movieViewModel.title)
        XCTAssertEqual(movieData.posterPath, movieViewModel.posterPath)
        XCTAssertEqual(movieData.overview, movieViewModel.overview)
        XCTAssertEqual(movieData.releaseDate, movieViewModel.releaseDate)
    }
}
