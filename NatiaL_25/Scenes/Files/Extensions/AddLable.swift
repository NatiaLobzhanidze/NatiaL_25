//
//  AddLable.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 28.08.22.
//

import Foundation
import UIKit

extension FilesViewController {
    func addHeadText() {
        
        headText.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,  paddingTop: 20, paddingLeft: 30, width: 200, height: 50)
        
        headText.text = "To Do List"
        headText.font = .systemFont(ofSize: 30, weight: .semibold)
    }
}
