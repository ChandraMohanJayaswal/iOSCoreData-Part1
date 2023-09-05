//
//  LoginVC.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 03/09/2023.
//

import UIKit

class LoginVC: BaseVC {
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    // MARK: - PRIVATE METHODS
    
    
    func isValidPassword(userName: String, password: String) -> Bool {
        guard let data =  KeychainHandler.get(userName: userName) else {
            print("Failed to read password")
            return false
        }
        
        let savedPassword = String(decoding: data, as: UTF8.self)
        let status = (savedPassword == password)
        if status {
            AppHandler.shared.loggedUserName = userName
        } else {
            AppHandler.shared.loggedUserName = nil
        }
        return status
    }
    
    func loadData() {
        self.txtUserName.text = "chandra"
        self.txtPassword.text = "chandra"
    }
    
    // MARK: - PUBLIC METHODS
    
    // MARK: - ACATION METHODS
    
    @IBAction func btnLoginAction(_ sender: Any) {
        let userName = self.txtUserName.text ?? ""
        let password = self.txtPassword.text ?? ""
        if self.isValidPassword(userName: userName, password: password) {
            self.moveToTabBarController()
        } else {
            let alert = UIAlertController(title: "Message", message: "Invalid Username or Passoword. Make sure you are already registered!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func btnRegisterAction(_ sender: Any) {
        self.moveToRegisterVC()
    }
    
    // MARK: - OVERRIDE METHDOS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    // MARK: - DELEGATE METHODS
    
}

