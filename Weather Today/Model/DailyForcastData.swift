//
//  DailyForcastData.swift
//  Weather Today
//
//  Created by sinbad on 5/3/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation
struct DailyForcastData: Decodable {
    let cod : String
    let message : Double
    let cnt : Int
    let list : [ListDaily]
    let city : City
}
struct City : Decodable {
    let name : String
    let coord : Coords
}
struct Coords: Decodable {
    let lon : Double
    let lat : Double
}
struct ListDaily : Decodable {
    let dt : Double
    let temp : DailyTempratue
    let weather : [Weather]
    let speed : Double
    let deg : Int
    let clouds : Int
    let pressure : Double
    let humidity : Double
}
struct DailyTempratue : Decodable{
    let day : Double
    let min : Double
    let max : Double
  //  let min : Double
    let night : Double
    let eve : Double
    let morn : Double
}
