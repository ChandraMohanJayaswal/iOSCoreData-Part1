//
//  SendEmailVC.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 05/09/2023.
//

import UIKit

class SendEmailVC: BaseVC {
    @IBOutlet weak var txtTopic: UITextField!
    @IBOutlet weak var txtSender: UITextField!
    @IBOutlet weak var txtReceiver: UITextField!
    @IBOutlet weak var txtMessage: UITextView!
    @IBOutlet weak var lblStatus: UILabel!
    
    // MARK: - PRIVATE METHODS
    
    private func loadData() {
        self.lblStatus.text = "Hi \(AppHandler.shared.loggedUserName ?? "NA")!"
        self.txtSender.text = AppHandler.shared.loggedUserName ?? ""
        
        let messageManager: MessageManager = MessageManager()
        let messages = messageManager.getAllEmails()
        messages?.forEach({ (message: Message) in
            message.description()
        })
    }
    
    // MARK: - PUBLIC METHODS
    
    // MARK: - ACATION METHODS
    
    @IBAction func btnLogoutAction(_ sender: Any) {
        super.moveToLoginVC()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func btnSendMessageAction(_ sender: Any) {
        let sender = AppHandler.shared.loggedUserName ?? ""
        let receiver = self.txtReceiver.text ?? ""
        let title = self.txtTopic.text ?? ""
        let body = self.txtMessage.text ?? ""
        if sender != "" && receiver != "" && title != "" && body != "" {
            let message = Message(messageId: UUID().uuidString, sender: sender, receiver: receiver, title: title, body: body, emailStatus: .none, timestamp: Date())
            let messageManager: MessageManager = MessageManager()
            messageManager.sendEmail(message: message)
        } else {
            let alert = UIAlertController(title: "Error", message: "Make sure non of the informations are missing!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    // MARK: - OVERRIDE METHDOS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }

    // MARK: - DELEGATE METHODS
    
    
}
