//
//  ScrollingViewController.swift
//  Pop
//
//  Created by Rob Crabtree on 11/13/17.
//  Copyright © 2017 Rob Crabtree. All rights reserved.
//

import UIKit

class ScrollingViewController: BaseViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!

    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let tapper = UITapGestureRecognizer()
        tapper.addTarget(self, action: #selector(viewTapped(sender:)))
        return tapper
    }()

    // TODO: uncomment
//    override var constraintToAdjustForKeyboard: NSLayoutConstraint? {
//        return scrollViewBottomConstraint
//    }

    @IBAction func sayIt(_ sender: UIButton) {
        guard let text = textField.text, text.count > 0 else { return }
        view.endEditing(true)
        showOkAlert(title: "You said", message: text, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.addGestureRecognizer(tapGestureRecognizer)
        textField.delegate = self
    }

    @objc func viewTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

extension ScrollingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
