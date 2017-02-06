//
//  WeakBox.swift
//  ListenerManagerGenerator
//
//  Created by Anton Selyanin on 06/02/2017.
//  Copyright © 2017 Anton Selyanin. All rights reserved.
//

import Foundation

class WeakBox<T> {
    private weak var weakObject: AnyObject?
    
    init(_ object: T) {
        self.object = object
    }
    
    var object: T? {
        get {
            return weakObject as? T
        }
        
        set {
            weakObject = newValue as AnyObject?
        }
    }
}
