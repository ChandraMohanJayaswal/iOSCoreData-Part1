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
        print("Read password: \(password)")
        return savedPassword == password
    }
    
    // MARK: - PUBLIC METHODS
    
    // MARK: - ACATION METHODS
    
    @IBAction func btnLoginAction(_ sender: Any) {
        if self.isValidPassword(userName: self.txtUserName.text ?? "", password: self.txtPassword.text ?? "") {
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
    }
    
    // MARK: - DELEGATE METHODS
    
}

