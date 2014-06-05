//
//  EKNetwork.swift
//  EKSwift_Test_1
//
//  Created by Emre Koc on 4.06.2014.
//  Copyright (c) 2014 Emre Koc. All rights reserved.
//

import Foundation
class EKNetwork:NSObject,NSURLConnectionDelegate, NSURLConnectionDataDelegate
{
    
    var data : NSMutableData = NSMutableData()
    var completionBlock:((NSDictionary) -> Void)!
    var failedBlock:(() -> Void)! 
    
    init()
    {
        
    }
    func getDataFromUrl(urlString : String,completion: ((NSDictionary) -> Void)!,failed: (() -> Void)!){
        self.completionBlock=completion
        self.failedBlock=failed
        var url : NSURL = NSURL(string: urlString)
        var request : NSURLRequest = NSURLRequest(URL: url)
        var connection : NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)
        connection.start()
    }
    func connection(_connection: NSURLConnection!,
        didReceiveResponse response: NSURLResponse!) {
            println("NSURLConnection didReceiveResponse");
    }
    func connection(_connection:NSURLConnection!,didFailWithError error:NSError!)
    {
         println("NSURLConnection didFailWithError")
        self.failedBlock()
    }
    func connection(connection : NSURLConnection!, didReceiveData data:NSData!)
    {
        self.data.appendData(data)
        println("NSURLConnection didReceiveData")
    }
    func connectionDidFinishLoading(connection : NSURLConnection!)
    {
        var result : NSDictionary = NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        if result.isKindOfClass(NSDictionary)
        {
            self.completionBlock(result)
        }
        else
        {
            println("json fail");
        }
   
    }
   

    
}