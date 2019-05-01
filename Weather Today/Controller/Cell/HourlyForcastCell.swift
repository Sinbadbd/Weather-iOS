//
//  HourlyForcastCell.swift
//  Weather Today
//
//  Created by sinbad on 5/1/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class HourlyForcastCell : UICollectionViewCell {
    
    let viewX : UIView = UIView()
    
    let hourlyTimeLabel : UILabel = UILabel()
    let hourlyIconImage : UIImageView = UIImageView()
    let hourlyTemLabel : UILabel = UILabel()
    let hourlyTemprature : UILabel = UILabel()
    let hourlyCelsius : UILabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       // view.backgroundColor = .white
        addSubview(viewX)
        viewX.translatesAutoresizingMaskIntoConstraints = false
        viewX.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        setupUI()
        
    }
    
    func setupUI(){
        viewX.addSubview(hourlyTimeLabel)
        hourlyTimeLabel.anchor(top: viewX.topAnchor, leading: viewX.leadingAnchor, bottom: nil, trailing: viewX.trailingAnchor)
        hourlyTimeLabel.text = "12.01"
        hourlyTimeLabel.textAlignment = .center
        
        addSubview(hourlyIconImage)
        hourlyIconImage.image = #imageLiteral(resourceName: "01d")
        hourlyIconImage.contentMode = .scaleAspectFit
        hourlyIconImage.clipsToBounds = true
        hourlyIconImage.anchor(top: hourlyTimeLabel.bottomAnchor, leading: viewX.leadingAnchor, bottom: nil, trailing: viewX.trailingAnchor, padding: .init(top: 2, left: 0, bottom: 0, right: 0), size: CGSize(width: 40, height: 40))
        hourlyIconImage.centerXInSuperview()
        
        addSubview(hourlyTemLabel)
        
        
        addSubview(hourlyTemprature)
       // hourlyTemprature.translatesAutoresizingMaskIntoConstraints = false
        hourlyTemprature.anchor(top: hourlyIconImage.bottomAnchor, leading: viewX.leadingAnchor, bottom: nil, trailing: viewX.trailingAnchor, padding: .init(top: 2, left: 0, bottom: 0, right: 0))
        hourlyTemprature.textColor = .black
        hourlyTemprature.textAlignment = .center
        hourlyTemprature.text = "50"
        hourlyTemprature.font = UIFont.systemFont(ofSize: 20)
        
        addSubview(hourlyCelsius)
      //  hourlyCelsius.translatesAutoresizingMaskIntoConstraints = false
        hourlyCelsius.anchor(top: hourlyTemprature.topAnchor, leading: nil, bottom: nil, trailing: viewX.trailingAnchor, padding: .init(top: 2, left: 0, bottom: 0, right: 8))
        hourlyCelsius.textColor = .black
        hourlyCelsius.text = "℃"
        hourlyCelsius.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
