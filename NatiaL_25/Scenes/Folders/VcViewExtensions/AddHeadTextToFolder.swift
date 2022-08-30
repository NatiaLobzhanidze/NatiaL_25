//
//  AddHeadText.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 25.08.22.
//

import Foundation
extension ViewController {
    
    func addHeadText() {
        
        headText.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
        
        headText.text = "To Do List"
        headText.font = .systemFont(ofSize: 30, weight: .semibold)
    }
    
    
    
}
