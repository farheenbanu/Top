//
//  ViewModel.swift
//  TopMoviesMVVM
//
//  Created by farheen banu on 9/5/17.
//  Copyright © 2017 Farheen Banu. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
  
  
 @IBOutlet weak var moviesClient: MoviesClient!
  var movies: [NSDictionary]?
  
  func fetchMovies(completion: @escaping ()->()){
    moviesClient.fetchMovies { (movies) in
      self.movies = movies
      completion()
    }
  }
  
  func numberOfItemsInSection(section: Int) -> Int{
    return movies?.count ?? 0
  }
  func titleFromIndexPath(indexPath: IndexPath) -> String{
    return movies?[indexPath.row].value(forKeyPath: "im:name.label") as? String ?? ""
  }
  
  
}
