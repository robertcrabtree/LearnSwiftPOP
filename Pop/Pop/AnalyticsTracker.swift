//
//  AnalyticsTracker.swift
//  Pop
//
//  Created by Rob Crabtree on 11/14/17.
//  Copyright © 2017 Rob Crabtree. All rights reserved.
//

import UIKit

// Trackable protocol
protocol Trackable {
    func track(_ tag: String, message: String?)
}

// Trackable extension
extension Trackable {
    func track(_ tag: String, message: String?) {
        if let message = message {
            print("Tracking \(tag): (\(message))")
        } else {
            print("Tracking \(tag)")
        }
    }
}

// Concrete type conforming to Trackable
struct PrintingAnalyticsTracker: Trackable { }

// Analytics tracker singleton / factory
struct AnalyticsTracker {
    static let shared: Trackable = PrintingAnalyticsTracker()
    private init() { }
}
