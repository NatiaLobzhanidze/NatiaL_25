//
//  AddTableView.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 28.08.22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
    
    func addTvConstraints() {
        tableView.anchor(top: headText.bottomAnchor,
                         left: view.leftAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor,
                         paddingTop: 10,
                         paddingLeft: 0,
                         paddingBottom: 0,
                         paddingRight: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forAllFolders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DirectoriesTableViewCell", for: indexPath) as? DirectoriesTableViewCell
        else { return UITableViewCell() }
        cell.titleLb.text =  "📂\(forAllFolders[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = FilesViewController()
        let folder = forAllFolders[indexPath.row]
        vc.folderAdress = folder
        vc.filesArray = fmServices.getFileNames(of: folder )
        print(vc.filesArray)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            fmServices.deleteDocument(folder: forAllFolders[indexPath.row])
            self.forAllFolders.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }
}
