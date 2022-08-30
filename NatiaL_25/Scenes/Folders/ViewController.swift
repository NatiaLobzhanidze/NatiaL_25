//
//  ViewController.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 25.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    var fmServices: FMServices!
    var forAllFolders = [String]()
    
    // lable
    
    let headText: UILabel = {
        let lb = UILabel()
       
    return lb
    }()
    
    // tableView
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.register(DirectoriesTableViewCell.self, forCellReuseIdentifier: "DirectoriesTableViewCell")
        return tv
    }()
    
    //plus button
    
    let addBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fmServices = FMServices()
        view.backgroundColor = .white
        setUpView()
        tableView.delegate = self
        tableView.dataSource = self
        fmServices.getListforDirectories{ [weak self] res in
            DispatchQueue.main.async {
                self?.forAllFolders = res!
                self?.tableView.reloadData()
            }
        }
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

