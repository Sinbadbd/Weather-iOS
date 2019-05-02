//
//  ViewController.swift
//  Weather Today
//
//  Created by sinbad on 1/8/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
import Kingfisher
import CoreLocation
class WeatherVC: UIViewController , CLLocationManagerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    
    let weatherContainer:UIView = UIView()
    let headerSection:UIView = UIView()
    
    let weatherIcon : UIImageView = UIImageView()
    let weatherConditionTitle : UILabel = UILabel()
    let weatherTemprature : UILabel = UILabel()
    let weatherCelsius : UILabel = UILabel()
    
    let locationManager = CLLocationManager()
    let CELL_ID = "CELL_ID"
    
    let collectionContent:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        setupView()
        hourlyForcastUI()
        view.layoutIfNeeded()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HourlyForcastCell.self, forCellWithReuseIdentifier: CELL_ID)
        
        
        locationManager.requestWhenInUseAuthorization()
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func hourlyForcastUI(){
        WeatherClient.getHourlyForcast { (response, error) in
            print("hourly:\(response)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! HourlyForcastCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 90)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var lat = WeatherClient.lat
        var lon = WeatherClient.lon
        let location = locations[0]
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerSection.setGradientBackground(colorTop: UIColor(red: 246/255, green: 130/255, blue: 139/255, alpha: 1), colorBottom: UIColor(red: 250/255, green: 166/255, blue: 119/255, alpha: 1))
    }
    
    
    func updateUI(){
        WeatherClient.getCurrentWeather { (response, error) in
             print(response)
            DispatchQueue.main.async {
                self.weatherCityTitle.text = response.name
                self.weatherTimeAndDate.text  =  "\((response.dt as! Double).getDateStringFromUTC())"
                let icon = response.weather[0].icon
                self.weatherIcon.image = UIImage(named: icon)
                self.weatherConditionTitle.text = response.weather[0].main
                self.weatherTemprature.text = "\(Int(round(response.main.temp - 273.15)))"
            }
        }
    }
    
    func setupView() {
        
        
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
        
        headerSection.addSubview(weatherCityTitle)
        weatherCityTitle.leftAnchor.constraint(equalTo: headerSection.leftAnchor, constant: 20).isActive = true
        weatherCityTitle.topAnchor.constraint(equalTo: headerSection.topAnchor , constant: 50).isActive = true
        
        
        headerSection.addSubview(weatherTimeAndDate)
        weatherTimeAndDate.leftAnchor.constraint(equalTo: headerSection.leftAnchor, constant: 20).isActive = true
        weatherTimeAndDate.topAnchor.constraint(equalTo: weatherCityTitle.bottomAnchor, constant: 5).isActive = true
        
        
        headerSection.addSubview(weatherIcon)
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.anchor(top: headerSection.topAnchor, leading: nil, bottom: nil, trailing: headerSection.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 40), size: CGSize(width: 100, height: 100))
        //weatherIcon.backgroundColor = .red
        
        headerSection.addSubview(weatherConditionTitle)
        weatherConditionTitle.translatesAutoresizingMaskIntoConstraints = false
        weatherConditionTitle.anchor(top: weatherIcon.bottomAnchor, leading: nil, bottom: nil, trailing: weatherContainer.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 40))
        weatherConditionTitle.textColor = .white
        weatherConditionTitle.textAlignment = .center
        weatherConditionTitle.font = UIFont.systemFont(ofSize: 25)
        
        headerSection.addSubview(weatherTemprature)
        weatherTemprature.translatesAutoresizingMaskIntoConstraints = false
        weatherTemprature.anchor(top: weatherTimeAndDate.bottomAnchor, leading: headerSection.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 30, left: 20, bottom: 0, right: 0))
        weatherTemprature.textColor = .white
        weatherTemprature.textAlignment = .center
        weatherTemprature.font = UIFont.systemFont(ofSize: 50)
        
        headerSection.addSubview(weatherCelsius)
        weatherCelsius.translatesAutoresizingMaskIntoConstraints = false
        weatherCelsius.anchor(top: weatherTemprature.topAnchor, leading: weatherTemprature.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 5, bottom: 0, right: 0))
        weatherCelsius.textColor = .white
        weatherCelsius.text = "℃"
        weatherCelsius.textColor = .white
        weatherCelsius.font = UIFont.systemFont(ofSize: 24)
        
    
        weatherContainer.addSubview(collectionContent)
        collectionContent.translatesAutoresizingMaskIntoConstraints = false
        collectionContent.anchor(top: headerSection.bottomAnchor, leading: weatherContainer.leadingAnchor, bottom: nil, trailing: weatherContainer.trailingAnchor, padding: .init(top: 20, left: 5, bottom: 0, right: 0), size: CGSize(width: view.frame.width, height: 100))
        collectionContent.backgroundColor = .red
        
        // collection View
        collectionContent.addSubview(collectionView)
        collectionView.anchor(top: collectionContent.topAnchor, leading: collectionContent.leadingAnchor, bottom: collectionContent.bottomAnchor, trailing: collectionContent.trailingAnchor)
        collectionView.backgroundColor = .white
    }
    
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
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
