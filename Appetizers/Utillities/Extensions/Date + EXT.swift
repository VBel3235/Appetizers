//
//  Date + EXT.swift
//  Appetizers
//
//  Created by Владислав Белов on 19.11.2021.
//

import Foundation

extension Date{
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
