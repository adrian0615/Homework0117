//
//  AvatarTableViewController.swift
//  Character2
//
//  Created by Adrian McDaniel on 1/18/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class AvatarTableViewController: UITableViewController {
    
    var characters: [Avatar] = [
        Avatar(name: "Alan", size: "Small", color: "Gold"),
        Avatar(name: "Rick", size: "Large", color: "Red"),
        Avatar(name: "Lisa", size: "Large", color: "Blue")
    ]
    
    subscript(_ index: Int) -> Avatar {
        return characters[index]
    }
    
    var indexOfAvatarToEdit: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.delegate = self
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell") as! AvatarCell
        let avatar = characters[indexPath.row]
        
        cell.nameLabel.text = avatar.name
        cell.colorLabel.text = "Color:\(avatar.color)"
        cell.sizeLabel.text = "Size:\(avatar.size)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let avatar = characters[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let editingVC = storyBoard.instantiateViewController(withIdentifier: "AvatarEdit") as! AvatarEditViewController
        indexOfAvatarToEdit = indexPath.row
        editingVC.avatar = avatar
        editingVC.delegate = self
        
        self.present(editingVC, animated: true, completion: nil)
    }
    
}

extension AvatarTableViewController : AvatarEditViewControllerDelegate {
    func avatarEditViewControllerDidEndEditing(_ viewController: AvatarEditViewController, avatar: Avatar) {
        
        
        if viewController === presentedViewController,
            let index = indexOfAvatarToEdit {
            characters[index] = avatar
            indexOfAvatarToEdit = nil
            tableView.reloadData()
            
            dismiss(animated: true, completion: nil)
        } else {
            fatalError("Wat?")
        }
    }
}

