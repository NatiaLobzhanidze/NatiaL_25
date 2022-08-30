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
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let sm = [1,2,3,4,5,6]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilesTableViewCell", for: indexPath) as? FilesTableViewCell
        else { return UITableViewCell() }
        cell.textLabel?.text = "\(sm[indexPath.row])"
//        cell.titleLb.text = "\(sm[indexPath.row])"
//        cell.noteLabel.text = "\(sm[indexPath.row])"
        tableView.reloadData()
        return cell
    }
}
