//
//  APError.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import Foundation

enum APError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    
  
}

enum AccountError: Error{
    case nameIsRequired
    case invalidEmail
}
