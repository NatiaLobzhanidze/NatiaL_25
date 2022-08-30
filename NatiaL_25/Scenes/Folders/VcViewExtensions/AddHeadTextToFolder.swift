//
//  AddHeadText.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 25.08.22.
//

import Foundation
extension ViewController {
    
    func addHeadText() {
        
        headText.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,  paddingTop: 20, paddingLeft: 30, width: 200, height: 50)
        
        headText.text = "My Folders"
        headText.font = .systemFont(ofSize: 30, weight: .semibold)
    }
    
    
    
}
