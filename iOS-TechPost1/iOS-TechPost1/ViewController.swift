//
//  ViewController.swift
//  iOS-TechPost1
//
//  Created by Jeff Schmitz on 4/19/17.
//  Copyright © 2017 Codefume. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class ViewController: UIViewController {
  
  let realm = try! Realm()
  var books: Results<Book>?
  var music: Results<Music>?
  var movies: Results<Movie>?
  var albums: Results<Album>?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.books = self.realm.objects(Book.self)
    self.music = self.realm.objects(Music.self)
    self.movies = self.realm.objects(Movie.self)
    self.albums = self.realm.objects(Album.self)

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func btnFetchMoviesPressed(_ sender: Any) {
    FetchData.get(type: Movie.self, success: {
      self.infoAlert(title: "Movie", message: "Successful fetched Movie information\n\(self.movies!.debugDescription)")
    }) { (error) in
      print("error")
      self.infoAlert(title: "Movie", message: "Unsuccessful fetched Movie information\n\(error.description)")
    }
  }
  
  @IBAction func btnFetchMusicPressed(_ sender: Any) {
    FetchData.get(type: Music.self, success: {
      self.infoAlert(title: "Music", message: "Successful fetched Music information\n\(self.music!.debugDescription)")
    }) { (error) in
      print("error")
      self.infoAlert(title: "Music", message: "Unsuccessful fetched Music information\n\(error.description)")
    }
  }

  @IBAction func btnFetchBooksPressed(_ sender: Any) {
    FetchData.get(type: Book.self, success: {
      self.infoAlert(title: "Book", message: "Successful fetched Book information\n\(self.books!.debugDescription)")
    }) { (error) in
      print("error")
      self.infoAlert(title: "Book", message: "Unsuccessful fetched Book information\n\(error.description)")
    }
  }
  
  @IBAction func btnFetchAlbumsPressed(_ sender: Any) {
    FetchData.get(type: Album.self, success: {
      self.infoAlert(title: "Album", message: "Successful fetched Album information\n\(self.albums!.debugDescription)")
    }) { (error) in
      print("error")
      self.infoAlert(title: "Album", message: "Unsuccessful fetched Album information\n\(error.description)")
    }
  }
  
  func infoAlert(title: String, message: String) -> Void {
    let actionSheetController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
    actionSheetController.addAction(cancelAction)
    self.present(actionSheetController, animated: true, completion: nil)
  }
}
