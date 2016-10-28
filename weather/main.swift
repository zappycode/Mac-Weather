//
//  main.swift
//  weather
//
//  Created by Nick Walter on 10/27/16.
//  Copyright © 2016 Zappy Code. All rights reserved.
//

import Foundation

let weather = Weather()

var location = ""

if CommandLine.arguments.count <= 1 {
    print("You need to provide a location!")
    weather.finished = true
} else {
    for index in 0..<CommandLine.arguments.count {
        if index != 0 {
            location += CommandLine.arguments[index] + " "
        }
    }
}

while !weather.finished {
    if !weather.apiLaunched {
        weather.getTemp(location: location)
        weather.apiLaunched = true
    }
}


