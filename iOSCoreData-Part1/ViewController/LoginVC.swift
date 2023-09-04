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
    
    func save(user: User) {
        do {
            try KeychainHandler.save(
                service: "iOSCoreData",
                account: user.userName,
                password: user.password.data(using: .utf8) ?? Data()
            )
        } catch {
            print(error)
        }
    }
    
    func isValidPassword(userName: String, password: String) -> Bool {
        guard let data =  KeychainHandler.get(service: "iOSCoreData", account: userName) else {
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
        let user = User(userName: self.txtUserName.text ?? "", password: self.txtPassword.text ?? "")
        if self.isValidPassword(userName: self.txtUserName.text ?? "", password: self.txtPassword.text ?? "") {
            self.moveToTabBarController()
        } else {
            let alert = UIAlertController(title: "Message", message: "Invalid Username or Passoword!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    // MARK: - OVERRIDE METHDOS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtUserName.text = "chandra"
        self.txtPassword.text = "chandra"
    }
    
    // MARK: - DELEGATE METHODS
    
    

}

