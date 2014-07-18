//
//  UIGestureRecognizer+ActionKit.swift
//  ActionKit
//
//  Created by Kevin Choi, Benjamin Hendricks on 7/17/14.
//  Copyright (c) 2014 ActionKit. All rights reserved.
//

import Foundation
import UIKit

extension UIGestureRecognizer {
    
    convenience init(closure: () -> ()) {
        self.init(target: ActionKitSingleton.sharedInstance, action: Selector("runGesture:"))
        ActionKitSingleton.sharedInstance.addGestureClosure(self, closure: closure)
    }
    
    func addClosure(closure: () -> ()) {
        self.addTarget(ActionKitSingleton.sharedInstance, action: Selector("runGesture:"))
        ActionKitSingleton.sharedInstance.addGestureClosure(self, closure: closure)
    }
    
    func removeClosure() {
        self.removeTarget(ActionKitSingleton.sharedInstance, action: Selector("runGesture:"))
        ActionKitSingleton.sharedInstance.removeGesture(self)
    }
}