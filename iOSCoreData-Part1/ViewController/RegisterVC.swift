//
//  RegisterVC.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 05/09/2023.
//

import UIKit

class RegisterVC: BaseVC {
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    // MARK: - PRIVATE METHODS
    
    // MARK: - PUBLIC METHODS
    
    // MARK: - ACATION METHODS
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.moveToLoginVC()
    }
    
    @IBAction func btnRegisterAction(_ sender: Any) {
        let userName = self.txtUserName.text ?? ""
        let password = self.txtPassword.text ?? ""
        if userName != "" && password != "" {
            do {
                try KeychainHandler.save(userName: userName, password: password.data(using: .utf8) ?? Data())
                self.moveToLoginVC()
            } catch {
                let alert = UIAlertController(title: "Message", message: "Error: \(error)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Message", message: "Make sure User name and Password is not empty!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    // MARK: - OVERRIDE METHDOS
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - DELEGATE METHODS
    

}
