//
//  BaseViewController.swift
//  Pop
//
//  Created by Rob Crabtree on 11/13/17.
//  Copyright © 2017 Rob Crabtree. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // The constraint to adjust for keyboard show and hide
    var constraintToAdjustForKeyboard: NSLayoutConstraint? { // subclasses should override
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Register for keyboard show and hide notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardMoved(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardMoved(_:)), name: .UIKeyboardWillHide, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }

    // What happens if a tableViewController, collectionViewController, tabBarController wants this functionality?
    func showOkAlert(title: String?, message: String?, completion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    // Do we want all viewControllers to inherit this functionality?
    @objc func keyboardMoved(_ notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard let constraint = constraintToAdjustForKeyboard else { return }
        guard let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }

        let keyboardHeight = UIScreen.main.bounds.size.height - endFrame.origin.y

        let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
        let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)

        // Move the view's edge along with the keyboard
        if endFrame.origin.y >= UIScreen.main.bounds.size.height {
            constraint.constant = 0.0
        } else {
            constraint.constant = keyboardHeight
        }

        UIView.animate(withDuration: duration, delay: TimeInterval(0), options: animationCurve, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
