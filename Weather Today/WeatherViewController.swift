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
        
        
        
        view.addSubview(weatherMidSection)
        weatherMidSection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        weatherMidSection.topAnchor.constraint(equalTo: view.topAnchor, constant: 260).isActive = true
        weatherMidSection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        // weatherMidSection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 12).isActive = true
        weatherMidSection.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        view.addSubview(weatherSevenDaysSection)
        weatherSevenDaysSection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        weatherSevenDaysSection.topAnchor.constraint(equalTo: view.topAnchor, constant: 370).isActive = true
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
    
    let weatherMidSection : UIView = {
        let weatherBD = UIView()
        weatherBD.backgroundColor = UIColor.red
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

