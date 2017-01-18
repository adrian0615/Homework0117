//
//  AvatarEditingViewController.swift
//  Character2
//
//  Created by Adrian McDaniel on 1/17/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

protocol AvatarEditingViewControllerDelegate: NSObjectProtocol {
    func avatarEditingViewControllerDidEndEditing(_ viewController: AvatarEditingViewController, avatar: Avatar)
    
}

class AvatarEditingViewController: UIViewController {
    var avatar: Avatar! = nil
    weak var delegate: AvatarEditingViewControllerDelegate?
    
    @IBAction func endNameEditing(_ sender: UIButton) {
        if let name = AvatarEditingViewController.validateText(inside: nameField) {
            avatar.name = name
            self.delegate?.avatarEditingViewControllerDidEndEditing(self, avatar: avatar)
        }
    }
    
    @IBAction func endSizeEditing(_ sender: UIButton) {
        if let name = AvatarEditingViewController.validateText(inside: nameField) {
            avatar.size = size
            self.delegate?.avatarEditingViewControllerDidEndEditing(self, avatar: avatar)
        }
    }
    
    @IBAction func endColorEditing(_ sender: UIButton) {
        if let name = AvatarEditingViewController.validateText(inside: nameField) {
            avatar.color = color
            self.delegate?.avatarEditingViewControllerDidEndEditing(self, avatar: avatar)
        }
    }
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var sizeField: UITextField!
    @IBOutlet var colorField: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameField.text = avatar.name
        self.sizeField.text = avatar.size
        self.colorField.text = avatar.color
    }
}

extension AvatarEditingViewController : UITextFieldDelegate {
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
        guard let name = AvatarEditingViewController.validateText(inside: nameField) else {
            return false
        }
        
        avatar.name = name
        avatar.size = size
        avatar.color = color
        textField.resignFirstResponder()
        return true
    }
    
}
