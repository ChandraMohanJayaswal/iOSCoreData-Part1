//
//  BaseVC.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 03/09/2023.
//

import UIKit

class BaseVC: UIViewController {

    // MARK: - PRIVATE METHODS
    
    // MARK: - PUBLIC METHODS
    
    func moveToLoginVC() {
        let viewControllers = self.navigationController?.viewControllers
        if let viewControllers = viewControllers {
            for aVC in viewControllers {
                if aVC is LoginVC {
                    self.navigationController?.popToViewController(aVC, animated: false)
                    return
                }
            }
        }
        let vc = NavigationHandler.initiateViewControllerWith(identifier: .LoginVC, storyboardName: .Main) as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToRegisterVC() {
        let viewControllers = self.navigationController?.viewControllers
        if let viewControllers = viewControllers {
            for aVC in viewControllers {
                if aVC is RegisterVC {
                    self.navigationController?.popToViewController(aVC, animated: false)
                    return
                }
            }
        }
        let vc = NavigationHandler.initiateViewControllerWith(identifier: .RegisterVC, storyboardName: .Main) as! RegisterVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func moveToTabBarController() {
        let storybaord = UIStoryboard(name: StoryboardNames.Main.rawValue, bundle: nil)
        let tabBarController = storybaord.instantiateViewController(withIdentifier: VCNames.TabBarController.rawValue) as! TabBarController
        self.navigationController?.pushViewController(tabBarController, animated: false)
    }
    
    // MARK: - ACATION METHODS
    
    // MARK: - OVERRIDE METHDOS
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - DELEGATE METHODS
    
}
