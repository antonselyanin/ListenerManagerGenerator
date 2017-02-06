//
// Created by Anton Selyanin on 04/02/2017.
// Copyright (c) 2017 Anton Selyanin. All rights reserved.
//

import Foundation

public class ListenerContainer<Listener> {
    private var listeners: [WeakBox<Listener>] = []

    public init() {}
    
    public func addListener(_ listener: Listener) {
        guard isUnique(listener) else { return }
        
        listeners.append(WeakBox(listener))
    }

    public func removeListener(_ listener: Listener) {
        listeners = listeners.filter({ weakRef in
            guard let object = weakRef.object else { return false }
            
            return !identical(object, listener)
        })
    }
    
    public func forEach(_ block: @escaping (Listener) -> Void) {
        fetchListeners().forEach(block)
    }
    
    private func fetchListeners() -> [Listener] {
        removeNilRef()
        
        return listeners.flatMap({ $0.object })
    }
    
    private func isUnique(_ listener: Listener) -> Bool {
        return !fetchListeners().contains(where: { identical($0, listener) })
    }
    
    private func removeNilRef() {
        listeners = listeners.filter({ $0.object != nil })
    }
}

private func identical(_ lhs: Any, _ rhs: Any) -> Bool {
    return (lhs as AnyObject?) === (rhs as AnyObject?)
}


