//
//  Weather.swift
//  weather
//
//  Created by Nick Walter on 10/27/16.
//  Copyright © 2016 Zappy Code. All rights reserved.
//

import Foundation

class Weather {
    
    var finished = false
    var apiLaunched = false
    
    func getTemp(location:String) {
        
        if let urlEncodedLocation = location.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[] \"").inverted) {
            
            if let url = URL(string: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22\(urlEncodedLocation)%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys") {
                
                URLSession.shared.dataTask(with: url, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
                    
                    if error != nil {
                        print("API ERROR!")
                    } else {
                        if data != nil {
                            let json = JSON(data: data!)
                            if let temp = json["query"]["results"]["channel"]["item"]["condition"]["temp"].string {
                                print("Temp: \(temp)°F")
                            }
                        }
                        
                        
                    }
                    
                    self.finished = true
                }).resume()
            } else {
                self.finished = true
            }
        } else {
            self.finished = true
        }
    }
    
}
