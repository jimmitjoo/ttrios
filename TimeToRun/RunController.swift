//
//  RunController.swift
//  TimeToRun
//
//  Created by Jimmie Johansson on 2015-05-27.
//  Copyright (c) 2015 HACKson. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RunController {
    
    class func jsonForRunResults (json: NSDictionary) -> [(name: String, id: String)] {
        
        var runItems: [(name : String, id: String)] = []
        
        var searchResult: (name: String, id: String)
        
        if json[0] != nil {
            
            let results:[AnyObject] = json[0]! as! [AnyObject]
            
            for items in results {
                
                if items["id"] != nil && items["name"] != nil {
                    let id:String = items["id"]! as! String
                    let name:String = items["name"]! as! String
                    
                    searchResult = (name: name, id: id)
                    runItems += [searchResult]
                }
                
            }
            
        }
        
        return runItems
        
    }
    
}