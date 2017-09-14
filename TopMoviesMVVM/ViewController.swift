//
//  ViewController.swift
//  TopMoviesMVVM
//
//  Created by farheen banu on 9/5/17.
//  Copyright © 2017 Farheen Banu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var viewModel: ViewModel!
  var isExpanded : Bool = false
  var expanded : [Int] = []{
    didSet{
      tableView.reloadData()
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    viewModel.fetchMovies {
      
      DispatchQueue.main.async {
          self.tableView.reloadData()
      }
    
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfItemsInSection(section: section)
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
    configureCell(cell: cell, forRowAtIndexPath: indexPath)
    return cell
  }

  func configureCell(cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath){
    cell.textLabel?.text = viewModel.titleFromIndexPath(indexPath: indexPath)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if expanded.contains(indexPath.row) {
      return 150
    }else{
       return 50
    }
   
    
    
  }
}

