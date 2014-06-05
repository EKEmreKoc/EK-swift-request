//
//  ViewController.swift
//  EK-swift-request
//
//  Created by Emre Koc on 4.06.2014.
//  Copyright (c) 2014 Emre Koc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
       
        var getIstanbulData:EKNetwork=EKNetwork()
        getIstanbulData.getDataFromUrl("http://api.openweathermap.org/data/2.5/weather?q=istanbul&mode=json", completion:{ (data:NSDictionary) -> Void in
            // println(data)
            println(data["name"])
            },failed:{ () -> Void in
                
                
            })
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

