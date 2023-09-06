//
//  Message.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 05/09/2023.
//

import Foundation

final class Message {
    var messageId: String = ""
    var sender: String = ""
    var receiver: String = ""
    var title: String = ""
    var body: String = ""
    var timestamp: Date = Date()

    init(messageId: String, sender: String, receiver: String, title: String, body: String, timestamp: Date) {
        self.messageId = messageId.trimmingCharacters(in: .whitespaces)
        self.sender = sender.trimmingCharacters(in: .whitespaces)
        self.receiver = receiver.trimmingCharacters(in: .whitespaces)
        self.title = title.trimmingCharacters(in: .whitespaces)
        self.body = body.trimmingCharacters(in: .whitespaces)
        self.timestamp = timestamp
    }
    
    func description() {
        debugPrint("MessageId: \(messageId) Sender: \(sender) Receiver: \(receiver) Title: \(title) Body: \(body) Date: \(timestamp)")
    }
}
