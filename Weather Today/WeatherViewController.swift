//
//  ViewController.swift
//  Weather Today
//
//  Created by sinbad on 1/8/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 249, green: 249, blue: 249, alpha: 1)
        
        setupView()
    }
    
    
    
    func setupView() {
        
        
        view.addSubview(weatherSectionBG)
        weatherSectionBG.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weatherSectionBG.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weatherSectionBG.heightAnchor.constraint(equalToConstant: 250).isActive = true
        // weatherSectionBG.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        //weather location title:
        weatherSectionBG.addSubview(weatherCityTitle)
        weatherCityTitle.leftAnchor.constraint(equalTo: weatherSectionBG.leftAnchor, constant: 20).isActive = true
        weatherCityTitle.topAnchor.constraint(equalTo: weatherSectionBG.topAnchor , constant: 50).isActive = true
        
        
        weatherSectionBG.addSubview(weatherTimeAndDate)
        weatherTimeAndDate.leftAnchor.constraint(equalTo: weatherSectionBG.leftAnchor, constant: 20).isActive = true
        weatherTimeAndDate.topAnchor.constraint(equalTo: weatherCityTitle.bottomAnchor, constant: 5).isActive = true
        
        
        view.addSubview(weatherMidSection)
        weatherMidSection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        weatherMidSection.topAnchor.constraint(equalTo: weatherSectionBG.bottomAnchor, constant: 15).isActive = true
        weatherMidSection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        weatherMidSection.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        
        view.addSubview(weatherSevenDaysSection)
        weatherSevenDaysSection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        weatherSevenDaysSection.topAnchor.constraint(equalTo: weatherMidSection.bottomAnchor, constant: 15).isActive = true
        weatherSevenDaysSection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        // weatherMidSection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 12).isActive = true
        weatherSevenDaysSection.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
        view.addSubview(weatherViewBottomSection)
        weatherViewBottomSection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        weatherViewBottomSection.topAnchor.constraint(equalTo: view.topAnchor, constant: 890).isActive = true
        weatherViewBottomSection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        // weatherMidSection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 12).isActive = true
        weatherViewBottomSection.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    // top section
    let weatherSectionBG : UIView = {
        let weatherBG = UIView()
        weatherBG.backgroundColor = UIColor.blue
        weatherBG.translatesAutoresizingMaskIntoConstraints = false
        return weatherBG
    }()
    
    // top weather section content
    
    let weatherCityTitle : UILabel = {
        let cityTitle = UILabel()
        cityTitle.translatesAutoresizingMaskIntoConstraints = false
        cityTitle.text = "Dhaka"
        cityTitle.font = UIFont.boldSystemFont(ofSize: 16)
        cityTitle.textColor = UIColor.white
        return cityTitle
    }()
    let weatherTimeAndDate : UILabel = {
        let cityTime = UILabel()
        cityTime.translatesAutoresizingMaskIntoConstraints = false
        cityTime.text = "Monday 13 2019, 12:00 AM"
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

