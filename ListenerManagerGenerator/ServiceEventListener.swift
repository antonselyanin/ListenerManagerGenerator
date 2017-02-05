//
//  ServiceEventListener.swift
//  ListenerManagerGenerator
//
//  Created by Anton Selyanin on 05/02/2017.
//  Copyright © 2017 Anton Selyanin. All rights reserved.
//

import Foundation

enum ServiceConnectionState {
    case connected
    case disconnected
}

struct ServiceEvent1 {}
struct ServiceEvent2 {}
class ServiceContext {}

protocol ServiceEventListener: class, AutoListenerManageable {
    func connectionStateChanged(_ state: ServiceConnectionState)
    
    func serviceEvent1(event1: ServiceEvent1)
    
    func serviceEvent2(event2: ServiceEvent2, additionalContext: ServiceContext)
    
    func serviceReset()
}
