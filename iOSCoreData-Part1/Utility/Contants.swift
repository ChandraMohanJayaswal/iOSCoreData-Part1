//
//  Contants.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 03/09/2023.
//

import Foundation

enum EmailStatus: Int {
    case none       = 0
    case deleted    = 1
    case draft      = 2
    case archived   = 3
    case spam       = 4
}

enum VCNames: String {
    case LoginVC, TabBarController, InboxVC, SentVC, RegisterVC, SendEmailVC
}

enum StoryboardNames: String {
    case Main
}
