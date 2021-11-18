//
//  User.swift
//  Appetizers
//
//  Created by Владислав Белов on 18.11.2021.
//

import Foundation

struct User: Codable{
    
    var firstName: String        = ""
    var lastName: String         = ""
    var email: String            = ""
    var birthday                 = Date()
    var extraNapkin              = Bool()
    var frequentRefills          = Bool()
}
