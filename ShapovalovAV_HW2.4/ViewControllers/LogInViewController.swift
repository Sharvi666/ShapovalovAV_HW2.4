//
//  LogInViewController.swift
//  ShapovalovAV_HW2.4
//
//  Created by Arthur on 29.08.2020.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logInAction() {
        checkingUserData()
    }
    @IBAction func forgotUserName() {
        attentionAlert(title: "Oops!", message: "Your name is User!")
    }
    @IBAction func forgotPassword() {
        attentionAlert(title: "Oops!", message: "Your password is 1234!")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "presentModally" else { return }
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let welcomeViewController = tabBarController.viewControllers?.first as? WelcomeViewController else { return }
        welcomeViewController.name = userNameTextField.text
    }
}

extension LogInViewController {
    func attentionAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    //Эта функция всегда возвращает nil(точнее user?.userName и user?.userPassword). Я не понимаю причину, я ведь вроде привел переменную user к типу User из модели.
    func checkingUserData() {
        if userNameTextField.text != user?.userName || userNameTextField.text == "" {
            attentionAlert(title: "Wrong format", message: "Enter your username")
            userNameTextField.text = ""
        }
        if userPasswordTextField.text != user?.userPassword || userPasswordTextField.text == "" {
            attentionAlert(title: "Wrong format", message: "Enter your password")
            userPasswordTextField.text = ""
        }
        
        //Работает только в таком виде.
//        if userNameTextField.text != "User" || userNameTextField.text == "" {
//            attentionAlert(title: "Wrong format", message: "Enter your username")
//            userNameTextField.text = ""
//        }
//        if userPasswordTextField.text != "1234" || userPasswordTextField.text == "" {
//            attentionAlert(title: "Wrong format", message: "Enter your password")
//            userPasswordTextField.text = ""
//        }
    }
}
