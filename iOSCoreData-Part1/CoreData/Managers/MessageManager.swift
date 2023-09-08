//
//  MessageManager.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 06/09/2023.
//

import Foundation

struct MessageManager {
    private let _messageRepo = MessageRepo()
    
    func sendEmail(message: Message) {
        _messageRepo.create(message: message)
    }
    
    func updateEmail(message: Message) {
        _messageRepo.update(message: message)
    }
    
    func deleteEmail(message: Message) {
        _messageRepo.delete(message: message)
    }
    
    func getAllEmails() -> [Message]? {
        return _messageRepo.readMessages()
    }
    
    func getSentEmails() -> [Message]? {
        return _messageRepo.readSentMessages()
    }
    
    func getReceivedEmails() -> [Message]? {
        return _messageRepo.readReceivedMessages()
    }
    
}
