//
//  SentVC.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 03/09/2023.
//

import UIKit

class SentVC: BaseVC {
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var tblMessage: UITableView!
    
    var messages:[Message] = []
    
    // MARK: - PRIVATE METHODS
    
    private func loadData() {
        self.lblStatus.text = "Hi \(AppHandler.shared.loggedUserName ?? "NA")!"
        self.messages = MessageManager().getSentEmails() ?? []
        self.tblMessage.reloadData()
    }
    
    // MARK: - PUBLIC METHODS
    
    // MARK: - ACATION METHODS
    
    @IBAction func btnLogoutAction(_ sender: Any) {
        super.moveToLoginVC()
    }
    
    @IBAction func btnSendEmailAction(_ sender: Any) {
        self.moveToSendEmailVC()
    }
    
    
    // MARK: - OVERRIDE METHDOS
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadData()
    }
    
    // MARK: - DELEGATE METHODS
    
}

extension SentVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tblMessage.dequeueReusableCell(withIdentifier: "cellMessage")!
        let message = self.messages[indexPath.row]
        cell.textLabel?.text = message.title
        return cell
        
    }
}

extension SentVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            let message = self.messages[indexPath.row]
            let messageManager = MessageManager()
            message.emailStatus = .deleted
            messageManager.updateEmail(message: message)
            self.messages.remove(at: indexPath.row)
            self.tblMessage.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
