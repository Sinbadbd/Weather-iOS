//
//  Extension + File.swift
//  Weather Today
//
//  Created by sinbad on 4/30/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation
extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
        return date
        
    }
}
extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
func convertMilliToDate(milliseconds: Int64) -> Date {
    return Date(timeIntervalSince1970: (TimeInterval(milliseconds) / 1000))
}
extension Double {
    func getDateStringFromUTC() -> String {
        let date = Date(timeIntervalSince1970: self)
        
        let dateFormatter = DateFormatter()
       // dateFormatter.locale = Locale(identifier: NSLocale.current.identifier)
        dateFormatter.dateFormat = "dd, MMMM yyyy HH:mm:a"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as! TimeZone
      //  dateFormatter.dateFormat = "EEEE"
       // dateFormatter.dateStyle = .medium
        
//        let date = NSDate(timeIntervalSince1970: self)
//        dateFormatter.locale = NSLocale(localeIdentifier: NSLocale.currentLocale().localeIdentifier)
//        dateFormatter.dateFormat = "EEEE"
//        return dateFormatter.stringFromDate(date)
        
        return dateFormatter.string(from: date)
    }
}
