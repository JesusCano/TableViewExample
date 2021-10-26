//
//  ViewController.swift
//  KeyboardExample
//
//  Created by Jesus Jaime Cano Terrazas on 26/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var currentTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - User interaction
    
    @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer) {
        currentTextField?.resignFirstResponder()
    }
    
    @IBAction func sendFormButton(_ sender: UIButton) {
        self.sendForm()
    }
    
    
    
    //MARK: -Private Methods
    
    @objc private func keyboardWillShow(notification: Notification) {
        print("Keyboard will appear")
        if let userInfo = notification.userInfo {
            let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
            let keyboardFrame = keyboardSize.cgRectValue
            
            //let keyboardInView =  view.convert(keyboardFrame, from: nil)
            //let safeAreaFrame = view.safeAreaLayoutGuide.layoutFrame.insetBy(dx: 0, dy: -additionalSafeAreaInsets.bottom)
            
            self.buttonBottomConstraint.constant = keyboardFrame.height - view.safeAreaInsets.bottom
            
            let animationTime = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            UIView.animate(withDuration: animationTime) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        if let userInfo = notification.userInfo {
            self.buttonBottomConstraint.constant = 0
            
            let animationTime = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            UIView.animate(withDuration: animationTime) {
                self.view.layoutIfNeeded()
            }
        }
        
    }
    
    private func sendForm() {
        currentTextField?.resignFirstResponder()
        
        guard let name = nameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let phone = phoneNumberTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if !email.isEmpty {
            print("\(name) \(email) \(phone) \(password)")
        }
        
        
        
    }


}

//MARK: - UITextFieldDelegate


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return has been pressed")
        
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            self.sendForm()
        default:
            print("Nothing to do here")
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.currentTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        currentTextField = nil
    }
}

