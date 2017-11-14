//
//  AnalyticsTracker.swift
//  Pop
//
//  Created by Rob Crabtree on 11/14/17.
//  Copyright © 2017 Rob Crabtree. All rights reserved.
//

import UIKit

protocol Trackable {
    func track(_ tag: String, message: String?)
}

extension Trackable {
    func track(_ tag: String, message: String?) {
        if let message = message {
            print("Tracking \(tag): (\(message))")
        } else {
            print("Tracking \(tag)")
        }
    }
}

struct PrintingAnalyticsTracker: Trackable { }

struct AnalyticsTracker: Trackable {
    static let shared: Trackable = PrintingAnalyticsTracker()
    private init() { }
}
