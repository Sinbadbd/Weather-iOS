//
//  CurrentWeather.swift
//  Weather Today
//
//  Created by sinbad on 4/30/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

/*
 
 "temp": 302.15,
 "pressure": 1005,
 "humidity": 70,
 "temp_min": 302.15,
 "temp_max": 302.15
 */

import Foundation
struct CurrentWeather {
    let id : Int
    let name : String
    let base : String
    let visibility : Int
    let dt: Int
    let coord : Coordinate
    let weather : [weather]
    let main : Main
    let wind : Wind
    let clouds : Clouds
    let sys : Sys
}

struct Coordinate {
    let lon : Float
    let lat : Float
}
struct weather {
    let id : Int
    let main : String
    let description: String
    let icon : String
}

struct Main {
    let temp : Float
    let pressure : Int
    let humidity : Int
    let temp_min : Float
    let temp_max : Float
}
struct Wind {
    let speed : Float
    let deg : Float
}
struct Clouds {
    let all : Int
}
struct Sys {
    let type : Int
    let id : Int
    let message : Float
    let country : String
    let sunrise : Int
    let sunset : Int
}
