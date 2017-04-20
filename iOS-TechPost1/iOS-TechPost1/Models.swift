//
//  Models.swift
//  iOS-TechPost1
//
//  Created by Jeff Schmitz on 4/19/17.
//  Copyright © 2017 Codefume. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

protocol Meta {
  static func url() -> String
}

class Music: Object, Mappable, Meta {
  dynamic var id = 0
  dynamic var title = ""
  dynamic var genre = ""
  dynamic var albumName = ""
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  //Impl. of Mappable protocol
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    id    <- map["id"]
    title <- map["title"]
    genre <- map["genre"]
    albumName <- map["albumName"]
    
  }
  
  //Impl. of Meta protocol
  static func url() -> String {
    return "https://bitbucket.org/hyphe/blog-examples/raw/master/fetchData/demoapi/music"
  }
}

class Movie: Object, Mappable, Meta {
  dynamic var id = 0
  dynamic var title = ""
  dynamic var genre = ""
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  //Impl. of Mappable protocol
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    id    <- map["id"]
    title <- map["title"]
    genre <- map["genre"]
  }
  
  //Impl. of Meta protocol
  static func url() -> String {
    return "https://bitbucket.org/hyphe/blog-examples/raw/master/fetchData/demoapi/movies"
  }
}

class Book: Object, Mappable, Meta {
  dynamic var id = 0
  dynamic var title = ""
  dynamic var autor = ""
  dynamic var genre = ""
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  //Impl. of Mappable protocol
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    id    <- map["id"]
    title <- map["title"]
    autor <- map["autor"]
    genre <- map["genre"]
  }
  
  //Impl. of Meta protocol
  static func url() -> String {
    return "https://bitbucket.org/hyphe/blog-examples/raw/master/fetchData/demoapi/books"
  }
}

class Album: Object, Mappable, Meta {
  dynamic var id = 0
  dynamic var title = ""
  dynamic var genre = ""
  dynamic var albumName = ""
  var tracks = List<Track>()
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  //Impl. of Mappable protocol
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    id    <- map["id"]
    title <- map["title"]
    genre <- map["genre"]
    albumName <- map["albumName"]
//    let information = Mapper<Track>().mapArray(map["tracks"].currentValue)
    let information = Mapper<Track>().mapArray(JSONObject: map["tracks"].currentValue)
    if let information = information {
      tracks.append(objectsIn: information)
    }
  }
  
  //Impl. of Meta protocol
  static func url() -> String {
    return "https://bitbucket.org/hyphe/blog-examples/raw/master/fetchData/demoapi/album"
  }
}

class Track: Object, Mappable {
  dynamic var id = 0
  dynamic var name = ""
  dynamic var runtime = ""
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  //Impl. of Mappable protocol
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    id    <- map["id"]
    name <- map["name"]
    runtime <- map["runtime"]
  }
}

