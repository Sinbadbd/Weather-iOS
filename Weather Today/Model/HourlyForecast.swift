 
import Foundation

 struct HourlyForcast : Decodable {
    
    let cod : String
    let message : Double
    let cnt : Int
    let list : [HourlyList]
 }
 struct HourlyList : Decodable {
    let dt : Int
    let main : MainList
    let weather : [Weather]
 }
 struct MainList : Decodable{
    let temp : Float
    let temp_min : Double
    let temp_max : Double
    let pressure : Double
    let sea_level : Double
    let grnd_level: Double
    let humidity : Double
    let temp_kf : Double
 }
