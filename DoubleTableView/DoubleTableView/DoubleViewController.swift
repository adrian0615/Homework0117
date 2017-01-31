//
//  DoubleViewController.swift
//  DoubleTableView
//
//  Created by Adrian McDaniel on 1/18/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class DoubleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movies: [Movie] = [Movie(title: "The Last Dragon"), Movie(title: "Golden Child"), Movie(title: "Coming to America")]
    
    
    
    var moviesToo: [Movie] = [Movie(title: "Indiana Jones"), Movie(title: "Terminator 2"), Movie(title: "School Daze")]
    
    @IBOutlet weak var topTableView: UITableView!
    @IBOutlet weak var bottomTableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        
        if tableView == self.topTableView {
            count = movies.count
        }
        
        if tableView == self.bottomTableView {
            count =  moviesToo.count
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        if tableView == self.topTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "DoubleTableViewCell") as! DoubleTableViewCell
            
            cell!.textLabel?.text = movies[indexPath.row].title
           
            
        }
        
        if tableView == self.bottomTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "DoubleTooTableViewCell", for: indexPath)
            
            cell!.textLabel?.text = moviesToo[indexPath.row].title
            
        }
        
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == self.topTableView {
            topTableView.deselectRow(at: indexPath, animated: true)
            
            moviesToo.append(movies[indexPath.row])
            movies.remove(at: indexPath.row)
            update()
        }
        
        if tableView == self.bottomTableView {
            bottomTableView.deselectRow(at: indexPath, animated: true)
            
            movies.append(moviesToo[indexPath.row])
            moviesToo.remove(at: indexPath.row)
            update()
        }
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        topTableView.delegate = self
        topTableView.dataSource = self
        
        bottomTableView.delegate = self
        bottomTableView.dataSource = self
        
        update()
        
        
    }
    
    func update() {
        topTableView.reloadData()
        bottomTableView.reloadData()
    }
    
    
    
    
    
    
}




/*class DoubleViewController: UIViewController {
 
 var movies: [Movie] = [Movie(title: "The Last Dragon"), Movie(title: "Golden Child"), Movie(title: "Coming to America")]
 
 var moviesToo: [Movie] = [Movie(title: "Indiana Jones"), Movie(title: "Terminator 2"), Movie(title: "School Daze")]
 
 @IBOutlet weak var tableView: UITableView!
 @IBOutlet weak var tableView1: UITableView!
 
 
 @IBOutlet var cell1TextLabel: UILabel!
 
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view, typically from a nib.
 
 tableView.delegate = self
 tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
 
 tableView1.delegate = self
 tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
 
 
 }
 
 
 func numberOfSections(in tableView: UITableView) -> Int {
 
 var count:Int?
 
 if tableView == self.tableView {
 count = 1
 }
 
 if tableView == self.tableView1 {
 count =  1
 }
 
 return count!
 
 }
 
 func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 // Return the number of items in the sample data structure.
 
 var count:Int?
 
 if tableView == self.tableView {
 count = movies.count
 }
 
 if tableView == self.tableView1 {
 count =  moviesToo.count
 }
 
 return count!
 
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
 var cell:UITableViewCell?
 
 if tableView == self.tableView {
 cell = tableView.dequeueReusableCell(withIdentifier: "cell")
 let movie = movies[indexPath.row]
 cell!.textLabel!.text = movie.title
 
 }
 
 if tableView == self.tableView1 {
 cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
 let movieToo = moviesToo[indexPath.row]
 
 cell!.textLabel!.text = movieToo.title
 
 }
 
 
 
 return cell!
 }
 
 
 
 }
 
 extension DoubleViewController : UITableViewDelegate {
 
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
 if tableView == self.tableView {
 let movie = movies[indexPath.row]
 
 moviesToo.append(movie)
 tableView1.reloadData()
 }
 
 if tableView == self.tableView1 {
 let movieToo = moviesToo[indexPath.row]
 movies.append(movieToo)
 tableView.reloadData()
 }
 }
 }*/

