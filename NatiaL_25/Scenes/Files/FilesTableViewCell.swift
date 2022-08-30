//
//  FilesTableViewCell.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 28.08.22.
//

import UIKit

class FilesTableViewCell: UITableViewCell {
   
    
   lazy var noteLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16)
        return lbl
    }()
        
    lazy var titleLb: UILabel = {
        let lbl = UILabel()
      
        return lbl
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLb)
        contentView.addSubview(noteLabel)
        setConstreintsToLbl()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstreintsToLbl() {
        
        titleLb.anchor(top: contentView.topAnchor,
                       left: contentView.leftAnchor,
                       bottom: nil,
                       right: contentView.rightAnchor,
                       paddingTop: 0,
                       paddingLeft: 10,
                       paddingBottom: 10,
                       paddingRight: 10,
                       width: nil, height: 50)
 
        noteLabel.anchor(top: titleLb.bottomAnchor,
                         left: contentView.leftAnchor,
                         bottom: contentView.bottomAnchor,
                         right: contentView.rightAnchor,
                         paddingTop: 10, paddingLeft: 10,
                         paddingBottom: 0, paddingRight: 10,
                         width: nil, height: 50)
        
      
    }

    


}
