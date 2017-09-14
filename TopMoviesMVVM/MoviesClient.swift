//
//  MoviesClient.swift
//  TopMoviesMVVM
//
//  Created by farheen banu on 9/5/17.
//  Copyright © 2017 Farheen Banu. All rights reserved.
//

import UIKit
// this will fetch movies from api
class MoviesClient: NSObject {
  func fetchMovies(completion: @escaping ([NSDictionary]?) -> ()){
    //fetch data
    let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
    let url = URL(string: urlString)!
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { (data, response, error) -> Void in
      if error != nil {
        completion(nil)
        return
      } else {
        do {
          let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary
          if let movies = json?.value(forKeyPath: "feed.entry") as? [NSDictionary] {
            completion(movies)
          }
        } catch {
          
        }
      }
    }
    task.resume()
  }
}
