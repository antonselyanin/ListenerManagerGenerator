//
// Created by Anton Selyanin on 04/02/2017.
// Copyright (c) 2017 Anton Selyanin. All rights reserved.
//

import Foundation

public class ListenerContainer<Listener> {
    private var listeners: [Listener] = []

    public init() {
        
    }
    
    public func addListener(_ listener: Listener) {
        guard !listeners.contains(where: { identical($0, listener) }) else { return }
        listeners.append(listener)
    }

    public func removeListener(_ listener: Listener) {
        listeners = listeners.filter({ !identical($0, listener) })
    }
    
    public func perform(_ block: @escaping (Listener) -> Void) {
        listeners.forEach(block)
    }
}

// temp hack
private func identical(_ lhs: Any, _ rhs: Any) -> Bool {
    return (lhs as AnyObject?) === (rhs as AnyObject?)
}

