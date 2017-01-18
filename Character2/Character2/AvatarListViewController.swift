//
//  AvatarListViewController.swift
//  Character2
//
//  Created by Adrian McDaniel on 1/17/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

import UIKit

class AvatarListViewController: UIViewController {
    let dataSource: CharacterListDataSource = CharacterListDataSource()
    var indexOfAvatarToEdit: Int? = nil
    
    var tableView: UITableView {
        return view as! UITableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.delegate = self
        self.tableView.dataSource = dataSource
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/*extension AvatarListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let avatar = dataSource[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let editingVC = storyBoard.instantiateViewController(withIdentifier: "AvatarEditing") as! AvatarEditingViewController
        indexOfAvatarToEdit = indexPath.row
        editingVC.avatar = avatar
        editingVC.delegate = self
        
        self.present(editingVC, animated: true, completion: nil)
    }
}*/

/*extension AvatarListViewController : AvatarEditingViewControllerDelegate {
    func avatarEditingViewControllerDidEndEditing(_ viewController: AvatarEditingViewController, avatar: Avatar) {
        
        
        if viewController === presentedViewController,
            let index = indexOfAvatarToEdit {
            dataSource.characters[index] = avatar
            indexOfAvatarToEdit = nil
            tableView.reloadData()
            
            dismiss(animated: true, completion: nil)
        } else {
            fatalError("Wat?")
        }
    }
}*/

class CharacterListDataSource: NSObject, UITableViewDataSource {
    var characters: [Avatar] = [
        Avatar(name: "Peter", size: "Small", color: "Gold"),
        Avatar(name: "Paul", size: "Large", color: "Red"),
        Avatar(name: "Mary", size: "Large", color: "Blue")
        ]
    
    subscript(_ index: Int) -> Avatar {
        return characters[index]
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell") as! AvatarCell
        let avatar = characters[indexPath.row]
        
        cell.nameLabel.text = avatar.name
        cell.colorLabel.text = avatar.color
        cell.sizeLabel.text = avatar.size
        
        return cell
    }
    
}


