//
//  SendEmailVC.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 05/09/2023.
//

import UIKit

class SendEmailVC: BaseVC {
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
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    // MARK: - OVERRIDE METHDOS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }

    // MARK: - DELEGATE METHODS
    
    
}
