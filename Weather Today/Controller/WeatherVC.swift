//
//  ViewController.swift
//  Weather Today
//
//  Created by sinbad on 1/8/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit 
import CoreLocation 

class WeatherVC: UIViewController , CLLocationManagerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var hourlyForcast = [HourlyList]()
    var dailyForcastResponse = [ListDaily]()
    
    let weatherContainer:UIView = UIView()
    let headerSection:UIView = UIView()
    
    let weatherIcon : UIImageView = UIImageView()
    let weatherConditionTitle : UILabel = UILabel()
    let weatherTemprature : UILabel = UILabel()
    let weatherCelsius : UILabel = UILabel()
    
    let locationManager = CLLocationManager()
    let CELL_ID = "CELL_ID"
    let DAILY_ID = "DAILY_ID"
    let collectionContent:UIView = UIView()
    
   // var barChart: BarChartView = Bar
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        setupView()
        setupAPIResponse()
        
        
        view.layoutIfNeeded()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HourlyForcastCell.self, forCellWithReuseIdentifier: CELL_ID)
        
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DailyForcastCell.self, forCellReuseIdentifier: DAILY_ID)
        
        locationManager.requestWhenInUseAuthorization()
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
         
        WeatherClient.getDailyForcast { (respose, error) in
            //self.dailyForcast = respose.list
            DispatchQueue.main.async {
               
                print(respose)
                self.dailyForcastResponse = respose.list
                self.tableView.reloadData()
            }
        }
        
    }
    
    func setupAPIResponse(){
        WeatherClient.getHourlyForcast { (response, error) in
            
            DispatchQueue.main.async {
                self.hourlyForcast = response.list
                self.collectionView.reloadData()
            }
        }
    }
     
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyForcast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! HourlyForcastCell
        
        let apiResponse = hourlyForcast[indexPath.item]
        cell.hourlyTimeLabel.text = "\((apiResponse.dt as! Double).getTime())"
        let icon = apiResponse.weather[0].icon
        cell.hourlyIconImage.image = UIImage(named: icon)
        cell.hourlyTemprature.text = "\(Int(round(apiResponse.main.temp - 273.15)))"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 90)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        var lat = WeatherClient.lat
//        var lon = WeatherClient.lon
//        let location = locations[0]
//        WeatherClient.getLocation { (response, error) in
//            print(lat, lon)
//        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerSection.setGradientBackground(colorTop: UIColor(red: 246/255, green: 130/255, blue: 139/255, alpha: 1), colorBottom: UIColor(red: 250/255, green: 166/255, blue: 119/255, alpha: 1))
    }
    
    
    func updateUI(){
        WeatherClient.getCurrentWeather { (response, error) in
           // print(response)
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
        weatherContainer.backgroundColor =  UIColor(red: 225/255, green: 214/255, blue: 226/255, alpha: 1)
        
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
        //collectionContent.backgroundColor = UIColor(red: 225/255, green: 214/255, blue: 226/255, alpha: 1)
        
        // collection View
        collectionContent.addSubview(collectionView)
        collectionView.anchor(top: collectionContent.topAnchor, leading: collectionContent.leadingAnchor, bottom: collectionContent.bottomAnchor, trailing: collectionContent.trailingAnchor)
        collectionView.backgroundColor = .clear
        
        
        weatherContainer.addSubview(tableView)
        tableView.anchor(top: collectionContent.bottomAnchor, leading: weatherContainer.leadingAnchor, bottom: weatherContainer.bottomAnchor, trailing: weatherContainer.trailingAnchor)
        
    }
    
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
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


extension WeatherVC : UITableViewDelegate, UITableViewDataSource {
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyForcastResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DAILY_ID, for: indexPath) as! DailyForcastCell
        let apiData = dailyForcastResponse[indexPath.item]
        let icon = apiData.weather[0].icon
        cell.weatherIcon.image = UIImage(named: icon)
        cell.dateNameLabel.text = "\((apiData.dt).getDate())"
        cell.dateLabel.text = "\((apiData.dt).getDateStringFromUTC())"
        cell.tempLabel.text = "\(Int(round(apiData.temp.day - 273.15)))"
        cell.weatherDescription.text = apiData.weather[0].description
        cell.maxTemlLabel.text = "\(Int(round(apiData.temp.max - 273.15)))"
       // cell.minTemlLabel.text = "\(Int(round(apiData.temp.min - 273.15)))"
        
        cell.selectionStyle = .none
        return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


}

