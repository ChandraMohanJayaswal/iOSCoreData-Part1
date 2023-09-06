//
//  CDMessage+Extension.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 05/09/2023.
//

import Foundation

extension CDMessage {
    func getMessage() -> Message {
        return Message(
            messageId: self.messageId ?? "NA",
            sender: self.sender ?? "NA",
            receiver: self.receiver ?? "NA",
            title: self.title ?? "NA",
            body: self.body ?? "NA",
            timestamp: self.timestamp ?? Date()
        )
    }
}
