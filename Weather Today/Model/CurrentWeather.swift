//
//  CurrentWeather.swift
//  Weather Today
//
//  Created by sinbad on 4/30/19.
//  Copyright © 2019 sinbad. All rights reserved.
//
 
import Foundation
struct CurrentWeather : Decodable {
//    let id : Int
    let name : String
//    let base : String
//    let visibility : Int
    let dt: Double
    let coord : Coordinate
    let weather : [Weather]
    let main : Main
//    let wind : Wind
//    let clouds : Clouds
//    let sys : Sys
}

struct Coordinate  : Decodable {
    let lon : Float
    let lat : Float
}
struct Weather : Decodable {
    let id : Int
    let main : String
    let description: String
    let icon : String
}

struct Main : Decodable {
    let temp : Float
    let pressure : Int
    let humidity : Int
    let temp_min : Float
    let temp_max : Float
}
struct Wind : Decodable {
    let speed : Float
    let deg : Float
}
struct Clouds : Decodable {
    let all : Int
}
struct Sys : Decodable {
    let type : Int
    let id : Int
    let message : Float
    let country : String
    let sunrise : Int
    let sunset : Int
}
