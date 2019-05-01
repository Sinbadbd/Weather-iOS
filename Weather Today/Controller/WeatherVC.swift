//
//  ViewController.swift
//  Weather Today
//
//  Created by sinbad on 1/8/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    let weatherContainer:UIView = UIView()
    let headerSection:UIView = UIView()
    
    var apiResponse = WeatherClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   view.backgroundColor = .white
        
        WeatherClient.getCurrentWeather { (response, error) in
            print(response)
            
            DispatchQueue.main.async {
                self.weatherCityTitle.text = response.name
                self.weatherTimeAndDate.text  =  "\((response.dt as! Double).getDateStringFromUTC())"
            }
            
            //(using: .utf8)!.prettyPrintedJSONString!
        }
        
        view.addSubview(weatherContainer)
        weatherContainer.translatesAutoresizingMaskIntoConstraints = false
        weatherContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        weatherContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weatherContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weatherContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        weatherContainer.backgroundColor = .white
        
        weatherContainer.addSubview(headerSection)
        headerSection.translatesAutoresizingMaskIntoConstraints = false
        headerSection.topAnchor.constraint(equalTo: weatherContainer.topAnchor, constant: 0).isActive = true
        headerSection.leftAnchor.constraint(equalTo: weatherContainer.leftAnchor).isActive = true
        headerSection.rightAnchor.constraint(equalTo: weatherContainer.rightAnchor).isActive = true
        headerSection.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        setupView()
        view.layoutIfNeeded()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerSection.setGradientBackground(colorTop: UIColor(red: 246/255, green: 130/255, blue: 139/255, alpha: 1), colorBottom: UIColor(red: 250/255, green: 166/255, blue: 119/255, alpha: 1))
    }
    
    
    
    
    func setupView() {
        
        
        
        // weatherSectionBG.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        //weather location title:
        headerSection.addSubview(weatherCityTitle)
        weatherCityTitle.leftAnchor.constraint(equalTo: headerSection.leftAnchor, constant: 20).isActive = true
        weatherCityTitle.topAnchor.constraint(equalTo: headerSection.topAnchor , constant: 50).isActive = true
        
        
        headerSection.addSubview(weatherTimeAndDate)
        weatherTimeAndDate.leftAnchor.constraint(equalTo: headerSection.leftAnchor, constant: 20).isActive = true
        weatherTimeAndDate.topAnchor.constraint(equalTo: weatherCityTitle.bottomAnchor, constant: 5).isActive = true
        
        
//        view.addSubview(weatherMidSection)
//        weatherMidSection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
//        weatherMidSection.topAnchor.constraint(equalTo: weatherSectionBG.bottomAnchor, constant: 15).isActive = true
//        weatherMidSection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
//        weatherMidSection.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        
//        view.addSubview(weatherSevenDaysSection)
//        weatherSevenDaysSection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
//        weatherSevenDaysSection.topAnchor.constraint(equalTo: weatherMidSection.bottomAnchor, constant: 15).isActive = true
//        weatherSevenDaysSection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
//        // weatherMidSection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 12).isActive = true
//        weatherSevenDaysSection.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
       //  view.addSubview(weatherViewBottomSection)
//        weatherViewBottomSection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
//        weatherViewBottomSection.topAnchor.constraint(equalTo: view.topAnchor, constant: 890).isActive = true
//        weatherViewBottomSection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
//        // weatherMidSection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 12).isActive = true
//        weatherViewBottomSection.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    // top section
//    let weatherSectionBG : UIView = {
//        let weatherBG = UIView()
//      //  weatherBG.setGradientBackground(colorTop: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1) , colorBottom: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) )
//        weatherBG.translatesAutoresizingMaskIntoConstraints = false
//        return weatherBG
//    }()
    
    // top weather section content
    
    let weatherCityTitle : UILabel = {
        let cityTitle = UILabel()
        cityTitle.translatesAutoresizingMaskIntoConstraints = false
        cityTitle.text = "--"
        cityTitle.font = UIFont.boldSystemFont(ofSize: 40)
        cityTitle.textColor = UIColor.white
        cityTitle.textAlignment = .center
        return cityTitle
    }()
    let weatherTimeAndDate : UILabel = {
        let cityTime = UILabel()
        cityTime.translatesAutoresizingMaskIntoConstraints = false
        cityTime.text = "---"
        cityTime.font = UIFont.boldSystemFont(ofSize: 12)
        cityTime.textColor = UIColor.white
        return cityTime
    }()
    
    
    
    let weatherMidSection : UIView = {
        let weatherBD = UIView()
        weatherBD.backgroundColor = UIColor.green
        weatherBD.translatesAutoresizingMaskIntoConstraints = false
        return weatherBD
    }()
    
    let weatherSevenDaysSection : UIView = {
        let weatherDays = UIView()
        weatherDays.backgroundColor = UIColor.red
        weatherDays.translatesAutoresizingMaskIntoConstraints = false
        return weatherDays
    }()
    
    let weatherViewBottomSection : UIView = {
        let weatherBottom = UIView()
        weatherBottom.backgroundColor = UIColor.red
        weatherBottom.translatesAutoresizingMaskIntoConstraints = false
        return weatherBottom
    }()
    
}

