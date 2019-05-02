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
    static var lat = 23.7805733
    static var lon = 90.2792399
    
    enum Endpoints {
        static let base = "https://api.openweathermap.org/data/2.5/"
        static let apiKeyParam = "&appid=\(WeatherClient.appid)"
        static let location = "?lat=\(WeatherClient.lat)&lon=\(WeatherClient.lon)"
        case getCurrentWeather
        case getHourlyForcast
        var stringValue : String{
            switch self {
            case .getCurrentWeather: return Endpoints.base + "weather" + Endpoints.location + Endpoints.apiKeyParam
            case .getHourlyForcast: return Endpoints.base + "forecast/hourly" + Endpoints.location + Endpoints.apiKeyParam
            }
        }
        var url : URL {
            return URL(string : stringValue)!
        }
    }
    
    class func getHourlyForcast(completion: @escaping(HourlyForcast, Error?)-> Void){
        let task = URLSession.shared.dataTask(with: Endpoints.getHourlyForcast.url) { (data, response, error) in
            print(Endpoints.getHourlyForcast.url)
            if let error = error {
                print(error.localizedDescription)
            }
            do {
                let decoder = JSONDecoder()
                let responseAPI = try decoder.decode(HourlyForcast.self, from: data!)
                print("hourly------\(responseAPI)")
                completion(responseAPI, nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    class func getCurrentWeather(completion: @escaping(CurrentWeather, Error?) -> Void){
        
        let task = URLSession.shared.dataTask(with: Endpoints.getCurrentWeather.url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CurrentWeather.self, from: data!)
                //print(response)
                completion(response, nil)
                
            } catch {
            }
        }
        task.resume()
    }
}

