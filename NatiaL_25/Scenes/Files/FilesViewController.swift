//
//  FilesViewController.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 28.08.22.
//

import UIKit

class FilesViewController: UIViewController {
    
    var fm: FMServices!
    
    var filesArray = [String]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    var folderAdress: String!
    
    let headText: UILabel = {
        let lb = UILabel()
        
        return lb
    }()
    
    // tableView
    
    let tableView: UITableView = {
        let tv = UITableView()
        
        return tv
    }()
    
    //plus button
    
    let addBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("New File", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FilesTableViewCell.self, forCellReuseIdentifier: "FilesTableViewCell")
        fm = FMServices()
        
    }
    
    func setUpView() {
        view.addSubview(headText)
        view.addSubview(addBtn)
        view.addSubview(tableView)
        addHeadText()
        addConstraintsToBtn()
        addTvConstraints()
    }
}
