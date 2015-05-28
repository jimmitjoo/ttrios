//
//  FirstViewController.swift
//  TimeToRun
//
//  Created by Jimmie Johansson on 2015-05-27.
//  Copyright (c) 2015 HACKson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var apiSearch:[(name: String, id: String)] = []
    
    var jsonResponse:NSDictionary!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        makeRequest("")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeRequest(searchString: String) {
        
        
        
        
        let url = NSURL(string: "http://timetorun.se/api/race/list/\(searchString)")
        //var request = NSMutableURLRequest(URL: NSURL(string: "http://timetorun.se/api/race/\(searchString)")!)
        
        /*let session = NSURLSession.sharedSession()
        request.HTTPMethod = "GET"
        var params = [
        "page": "1"
        ]
        var error: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &error)
        */
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, err) -> Void in
            //println(data)
            var stringData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println(stringData)
            var conversionError: NSError?
            var jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves, error: &conversionError) as? NSDictionary
            println(jsonDictionary)
            
            if conversionError != nil {
                NSLog(<#format: String#>, <#args: CVarArgType#>...)(@"JSON Error: %@", conversionError)
            }
            if jsonDictionary != nil {
                self.jsonResponse = jsonDictionary!
                self.apiSearch = RunController.jsonForRunResults(jsonDictionary!)
            }
        })
        task.resume()
        
        /*
        
        let task = session.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) ->
        Void in
        
        var conversionError: NSError?
        var stringData = NSString(data: data, encoding: NSUTF8StringEncoding)
        
        var jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves, error: &conversionError)
        
        
        
        println(stringData)
        println(response)
        
        if conversionError != nil {
        println(conversionError!.localizedDescription)
        let errorString = NSString(data: data, encoding: NSUTF8StringEncoding)
        println("Error in Parsing \(errorString)")
        } else {
        let errorString = NSString(data: data, encoding: NSUTF8StringEncoding)
        
        if stringData != nil {
        
        self.jsonResponse = stringData!
        
        self.apiSearch = RunController.jsonForRunResults(stringData!)
        
        } else {
        println("Error could not Parse JSON \(errorString)")
        }
        
        }
        
        })
        
        task.resume()
        */
        
    }
    
    
}

