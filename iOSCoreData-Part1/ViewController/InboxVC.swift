//
//  InboxVC.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 03/09/2023.
//

import UIKit

class InboxVC: BaseVC {
    @IBOutlet weak var tblMessage: UITableView!
    @IBOutlet weak var lblStatus: UILabel!
    
    var messages:[Message] = []
    // MARK: - PRIVATE METHODS
    
    private func loadData() {
        self.lblStatus.text = "Hi \(AppHandler.shared.loggedUserName ?? "NA")!"
        self.messages = MessageManager().getReceivedEmails() ?? []
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

extension InboxVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tblMessage.dequeueReusableCell(withIdentifier: "cellMessage")!
        let message = self.messages[indexPath.row]
        cell.textLabel?.text = message.title
        return cell
        
    }
}

extension InboxVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let message = self.messages[indexPath.row]
        debugPrint(message.description())
    }
}
