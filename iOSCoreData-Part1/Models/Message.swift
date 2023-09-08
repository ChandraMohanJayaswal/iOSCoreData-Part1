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
    var emailStatus: EmailStatus = .none
    var timestamp: Date = Date()

    init(messageId: String, sender: String, receiver: String, title: String, body: String, emailStatus: EmailStatus, timestamp: Date) {
        self.messageId = messageId.trimmingCharacters(in: .whitespaces)
        self.sender = sender.trimmingCharacters(in: .whitespaces)
        self.receiver = receiver.trimmingCharacters(in: .whitespaces)
        self.title = title.trimmingCharacters(in: .whitespaces)
        self.body = body.trimmingCharacters(in: .whitespaces)
        self.emailStatus = emailStatus
        self.timestamp = timestamp
    }
    
    func description() {
        debugPrint("MessageId: \(messageId) Sender: \(sender) Receiver: \(receiver) Title: \(title) Body: \(body) Status: \(emailStatus) Date: \(timestamp)")
    }
}
