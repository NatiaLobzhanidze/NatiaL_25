//
//  NotesViewController.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 30.08.22.
//

import UIKit

class NotesViewController: UIViewController , UITextViewDelegate {
    var textViewContent: String!
    var fileUrl: URL!
    let noteTxtView: UITextView = {
        let txt = UITextView()
        txt.frame = CGRect(x: 20, y: 100, width: Int(UIScreen.main.bounds.width) - 40, height: Int(UIScreen.main.bounds.height) - 200 )
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.blue.cgColor
        
        return txt
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(noteTxtView)
        noteTxtView.delegate = self
        noteTxtView.text = textViewContent
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        guard let textView = textView.text else { return}
        do {
            try textView.write(to: self.fileUrl, atomically: false, encoding: .utf8)
        } catch {
            print(error)
        }
    }
}
