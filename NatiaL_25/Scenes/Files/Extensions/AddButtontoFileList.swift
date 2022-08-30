//
//  AddButton.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 28.08.22.
//

import Foundation
import UIKit

extension FilesViewController {
    
    func addConstraintsToBtn() {
        
        addBtn.addTarget(self, action: #selector(addFile), for: .touchUpInside)
        addBtn.centerYAnchor.constraint(equalTo: headText.centerYAnchor).isActive = true
      
        addBtn.anchor(top: nil, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 30, width: 60, height: 30)
    }
    
  
    @objc func addFile() {

        let alert = UIAlertController(title: "Add", message: "New Folder", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
        guard let textField = alert.textFields?.first, let reminderText = textField.text else { return }
            
            fm.addNewFile(with: ReminderModel(folderName: self.folderAdress, fileName: "Reminder", content: reminderText))
            
            //self.filesArray.append()
            
              
          }
        
          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
          alert.addTextField()
          alert.addAction(saveAction)
          alert.addAction(cancelAction)
          present(alert, animated: true)
        }
     
}
