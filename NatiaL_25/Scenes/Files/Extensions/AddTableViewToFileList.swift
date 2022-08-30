//
//  AddTableView.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 28.08.22.
//

import Foundation
import UIKit

extension FilesViewController: UITableViewDelegate, UITableViewDataSource {
  
    func addTvConstraints() {
        
        tableView.anchor(top: headText.bottomAnchor,
                         left: view.leftAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor,
                         paddingTop: 10,
                         paddingLeft: 0,
                         paddingBottom: 0,
                         paddingRight: 0,
                         width: nil, height: nil)
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilesTableViewCell", for: indexPath) as? FilesTableViewCell
        else { return UITableViewCell() }
        
        cell.textLabel?.text = "\(filesArray[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let folder = folderAdress else { return }
        let file = filesArray[indexPath.row]
        let textFilePath = FileManager.getDocumentsDirectory().appendingPathComponent(folder).appendingPathComponent(file)
        let text = try? String(contentsOf: textFilePath, encoding: .utf8)
        
        let vc = NotesViewController()
        vc.fileUrl = textFilePath
        vc.textViewContent = text
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
