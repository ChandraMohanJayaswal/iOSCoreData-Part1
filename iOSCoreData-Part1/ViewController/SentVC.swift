//
//  SentVC.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 03/09/2023.
//

import UIKit

class SentVC: BaseVC {

    // MARK: - PRIVATE METHODS
    @IBOutlet weak var lblStatus: UILabel!

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
