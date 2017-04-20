//
//  FetchData.swift
//  iOS-TechPost1
//
//  Created by Jeff Schmitz on 4/19/17.
//  Copyright © 2017 Codefume. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift

class FetchData {
  
//  static func get <T: Object where T:Mappable, T:Meta> (type: T.Type, success:() -> Void, fail:(_ error:NSError)->Void)->Void {
//    
////    Alamofire.request(Method.GET, type.url())
////      .responseArray { (response: Response<[T], NSError>) in
////        switch response.result {
////        case .Success(let items):
////          autoreleasepool {
////            do {
////              let realm = try Realm()
////              try realm.write {
////                for item in items {
////                  realm.add(item, update: true)
////                }
////              }
////            } catch let error as NSError {
////              fail(error: error)
////            }
////          }
////          success()
////        case .Failure(let error):
////          fail(error: error)
////        }
////    }
//    
//  }
  
  static func get <T: Object> (type: T.Type, success:() -> Void, fail:(_ error:NSError)->Void)->Void where T:Mappable, T:Meta {
    
  }
  
}
