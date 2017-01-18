//
//  AvatarEditViewController.swift
//  Character2
//
//  Created by Adrian McDaniel on 1/18/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

protocol AvatarEditViewControllerDelegate: NSObjectProtocol {
    func avatarEditViewControllerDidEndEditing(_ viewController: AvatarEditViewController, avatar: Avatar)
    
}

class AvatarEditViewController: UIViewController {
    
    var avatar: Avatar! = nil
    weak var delegate: AvatarEditViewControllerDelegate?
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var sizeField: UITextField!
    @IBOutlet var colorField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameField?.text = avatar.name
        self.colorField?.text = avatar.color
        self.sizeField.text = avatar.size
    }
    
    @IBAction func endEditing(_ sender: UIButton) {
        if let name = AvatarEditViewController.validateText(inside: nameField) {
            avatar.name = name
            self.delegate?.avatarEditViewControllerDidEndEditing(self, avatar: avatar)
        }
    }
    
    @IBAction func endEditing2(_ sender: UIButton) {
        if let size = AvatarEditViewController.validateText(inside: sizeField) {
            avatar.size = size
            self.delegate?.avatarEditViewControllerDidEndEditing(self, avatar: avatar)
        }
    }
    
    @IBAction func endEditing3(_ sender: UIButton) {
        if let color = AvatarEditViewController.validateText(inside: colorField) {
            avatar.color = color
            self.delegate?.avatarEditViewControllerDidEndEditing(self, avatar: avatar)
        }
    }
    
    
}


extension AvatarEditViewController : UITextFieldDelegate {
    static func validateText(inside field: UITextField) -> String? {
        if let text = field.text, text.isEmpty == false {
            return text
        } else {
            return nil
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return textField.text?.isEmpty == false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let name = AvatarEditViewController.validateText(inside: nameField), let size = AvatarEditViewController.validateText(inside: sizeField), let color = AvatarEditViewController.validateText(inside: colorField) else {
            return false
            
            
        }
        
        avatar.name = name
        avatar.color = color
        avatar.size = size
        textField.resignFirstResponder()
        return true
    }
}
