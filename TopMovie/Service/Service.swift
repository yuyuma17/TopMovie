//
//  Service.swift
//  TopMovie
//
//  Created by 黃士軒 on 2020/2/28.
//  Copyright © 2020 Lacie. All rights reserved.
//

import Foundation

class Service: NSObject {
    
    static let shared = Service()
    
    func fetchMovies(completion: @escaping ([MovieData]?, Error?) -> ()) {
        
        let urlString = "https://api.themoviedb.org/3/discover/movie?api_key=dbeab9fc9a26cdb6d42fbad76a28e5f6&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&year=2020"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
                print("Failed to fetch movies:", error.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("status code: \(response.statusCode)")
            }
            
            guard let data = data else { return }
            do {
                var movieData = [MovieData]()
                let movies = try JSONDecoder().decode(Movie.self, from: data)
                for movie in movies.results {
                    movieData.append(MovieData(posterPath: movie.posterPath ?? "", title: movie.title ?? "", overview: movie.overview ?? "", releaseDate: movie.releaseDate ?? ""))
                }
                DispatchQueue.main.async {
                    completion(movieData, nil)
                }
            } catch let jsonError {
                print("Failed to decode:", jsonError.localizedDescription)
            }
        }.resume()
    }
}
