//
//  AppHandler.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 05/09/2023.
//

import Foundation

class AppHandler {
    static let shared = AppHandler()
    
    var loggedUserName: String?
    
    private init () {
        
    }
}
