//
//  MessageRepo.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 05/09/2023.
//

import Foundation
import CoreData

protocol MessageRepoProtocol {
    func create(message: Message)
    func update(message: Message)
    func delete(message: Message)
    func readMessages() -> [Message]?
}

struct MessageRepo: MessageRepoProtocol {
    func create(message: Message) {
        message.description()
        let cdMessage = CDMessage(context: PersistentStorage.shared.context)
        cdMessage.messageId = message.messageId
        cdMessage.sender = message.sender
        cdMessage.receiver = message.receiver
        cdMessage.title = message.title
        cdMessage.body = message.body
        cdMessage.timestamp = message.timestamp
        PersistentStorage.shared.saveContext()
    }
    
    func update(message: Message) {
        //Make sure we have this message or not. If message exists then update.
        let cdMessage = getCDMessage(by: message.messageId)
        guard cdMessage != nil else {
            return
        }
        cdMessage?.body = message.body
        cdMessage?.title = message.title
        cdMessage?.receiver = message.receiver
        cdMessage?.sender = message.sender
        PersistentStorage.shared.saveContext()
    }
    
    func delete(message: Message) {
        //Make sure we have this message or not. If message exists then delete.
        let cdMessage = getCDMessage(by: message.messageId)
        guard cdMessage != nil else {
            return
        }
        PersistentStorage.shared.context.delete(cdMessage!)
        PersistentStorage.shared.saveContext()
    }
        
//    func readMessages() -> [Message]? {
//        let fetchRequest = NSFetchRequest<CDMessage>(entityName: "CDMessage")
//        do {
//            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
//            var messages: [Message] = []
//            result.forEach({ (cdMessage: CDMessage) in
//                let message = cdMessage.getMessage()
//                messages.append(message)
//            })
//            return messages
//        } catch {
//            debugPrint(error)
//        }
//        return nil
//    }
    
    func readMessages() -> [Message]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDMessage.self)
        guard let result = result else {
            return nil
        }
        var messages: [Message] = []
        result.forEach({ (cdMessage: CDMessage) in
            let message = cdMessage.getMessage()
            messages.append(message)
        })
        return messages
    }
    
    private func getCDMessage(by id: String) -> CDMessage? {
        let fetchRequest = NSFetchRequest<CDMessage>(entityName: "CDMessage")
        let predicate = NSPredicate(format: "messageId==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {
                return nil
            }
            return result
        } catch {
            debugPrint(error)
        }
        return nil
    }
    
}
