//
//  InboxVC.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 03/09/2023.
//

import UIKit

class InboxVC: BaseVC {
    @IBOutlet weak var lblStatus: UILabel!
    
    // MARK: - PRIVATE METHODS
    
    private func loadData() {
        self.lblStatus.text = "Hi \(AppHandler.shared.loggedUserName ?? "NA")!"
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
        self.loadData()
    }

    // MARK: - DELEGATE METHODS
    
    
}
