//
//  PlainViewController.swift
//  Pop
//
//  Created by Rob Crabtree on 11/14/17.
//  Copyright © 2017 Rob Crabtree. All rights reserved.
//

import UIKit

class PlainViewController: BaseViewController {
    var showAlert: Bool = true
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if showAlert {
            // Using base class ok alert
            showOkAlert(title: "Welcome", message: "Subclassing rocks!", completion: nil)
        }
        showAlert = false
    }
}
