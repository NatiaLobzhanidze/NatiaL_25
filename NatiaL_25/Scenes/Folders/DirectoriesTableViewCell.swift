//
//  DirectoriesTableViewCell.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 28.08.22.
//

import Foundation
import UIKit

class DirectoriesTableViewCell: UITableViewCell {
   
    let titleLb: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 19)
       // lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(titleLb)
        setConstreintsToLbl()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstreintsToLbl() {
        titleLb.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: nil, height: 50)
        
    }

}
