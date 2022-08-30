//
//  AddButton.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 28.08.22.
//

import Foundation
import UIKit
extension ViewController {
    
  func addConstraintsToBtn() {
        
    addBtn.addTarget(self, action: #selector(addFolder), for: .touchUpInside)
    addBtn.centerYAnchor.constraint(equalTo: headText.centerYAnchor).isActive = true
      
    addBtn.anchor(right: view.rightAnchor, paddingRight: 30, width: 60, height: 30)
    }
    
  
    @objc func addFolder() {
    
        let alert = UIAlertController(title: "Add", message: "New Folder", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
        guard let textField = alert.textFields?.first, let newNote = textField.text else { return }
            
            
            DispatchQueue.main.async {
                fmServices.createFolder(with: newNote)
                self.forAllFolders.insert(newNote, at: 0)
               tableView.reloadData()
                
            }
            DispatchQueue.main.async {
                LocalNotManager.register(notification: LocalNotificationModel(id: UUID().uuidString, title: "Local Notification", message: "New Folder's been Added"), duration: 5, repeats: false, userInfo: ["Folder" : newNote])
            }
          }
        
          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
          alert.addTextField()
          alert.addAction(saveAction)
          alert.addAction(cancelAction)
          present(alert, animated: true)
        }
     
}
