//
//  KeyboardExt.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/24/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import UIKit
import Foundation


extension UIViewController {
    
    @objc func keyboardWillShow(notifaction: NSNotification) {
        if let keyboardSize = (notifaction.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 50
            }
        }
    }
    @objc func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }
    
    func hideKeyboardTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
   
}
