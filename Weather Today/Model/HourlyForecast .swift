 
import Foundation

 struct HourlyForcast : Decodable {
    
    let cod : String
    let message : String
    let list : [HourlyList]
 }
 struct HourlyList : Decodable {
    let dt : Int
    let main : MainList
 }
 struct MainList : Decodable{
    let temp : Float
    let pressure : Double
    let humidity : Double
    let temp_min : Double
    let temp_max : Double
    let sea_level : Double
    let temp_kf : Double
 }
