//
//  Connection.swift
//  Weather Today
//
//  Created by sinbad on 4/30/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation
class WeatherClient {
    static let appid = "f279df88f01232850ddff621c125603d"
    
    enum Endpoints {
        static let base = "https://api.openweathermap.org/data/2.5/"
        static let apiKeyParam = "&appid=\(WeatherClient.appid)"
        static let location = "?q=dhaka,bd"
        case getCurrentWeather
        
        var stringValue : String{
            switch self {
            case .getCurrentWeather: return Endpoints.base + "weather" + Endpoints.location + Endpoints.apiKeyParam
                
                
            }
        }
        var url : URL {
            return URL(string : stringValue)!
        }
    }
    class func getCurrentWeather(completion: @escaping(CurrentWeather, Error?) -> Void){
        
        let task = URLSession.shared.dataTask(with: Endpoints.getCurrentWeather.url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CurrentWeather.self, from: data!) 
                completion(response, nil)
                
            } catch {
            //  print(completion(nil, error))
            }
             //print(response)
        }
        task.resume()
        
    }
    
    
}
