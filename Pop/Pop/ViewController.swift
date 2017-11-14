//
//  ViewController.swift
//  Pop
//
//  Created by Rob Crabtree on 11/13/17.
//  Copyright © 2017 Rob Crabtree. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!

    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let tapper = UITapGestureRecognizer()
        tapper.addTarget(self, action: #selector(viewTapped(sender:)))
        return tapper
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func viewTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

