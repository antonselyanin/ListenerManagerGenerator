// Generated using Sourcery 0.5.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import ListenerContainer

class ExampleListenerManager: ExampleListener {
    private let container: ListenerContainer<ExampleListener> = ListenerContainer()

    func addListener(_ listener: ExampleListener) {
        container.addListener(listener)
    }

    func removeListener(_ listener: ExampleListener) {
        container.removeListener(listener)
    }
    
    func notify1(event1: Event1) {
        container.perform { listener in
            listener.notify1(event1: event1)
        }
    }
    
    func notify2(event2: Event2) {
        container.perform { listener in
            listener.notify2(event2: event2)
        }
    }
    
    func notify3() {
        container.perform { listener in
            listener.notify3()
        }
    }
    
    func notify4(event1: Event1, event2: Event2) {
        container.perform { listener in
            listener.notify4(event1: event1, event2: event2)
        }
    }
    
    func notify5(_ event1: Event1, event2 theEvent: Event2) {
        container.perform { listener in
            listener.notify5(event1, event2: theEvent)
        }
    }
    
}

class ServiceEventListenerManager: ServiceEventListener {
    private let container: ListenerContainer<ServiceEventListener> = ListenerContainer()

    func addListener(_ listener: ServiceEventListener) {
        container.addListener(listener)
    }

    func removeListener(_ listener: ServiceEventListener) {
        container.removeListener(listener)
    }
    
    func connectionStateChanged(_ state: ServiceConnectionState) {
        container.perform { listener in
            listener.connectionStateChanged(state)
        }
    }
    
    func serviceEvent1(event1: ServiceEvent1) {
        container.perform { listener in
            listener.serviceEvent1(event1: event1)
        }
    }
    
    func serviceEvent2(event2: ServiceEvent2, additionalContext: ServiceContext) {
        container.perform { listener in
            listener.serviceEvent2(event2: event2, additionalContext: additionalContext)
        }
    }
    
    func serviceReset() {
        container.perform { listener in
            listener.serviceReset()
        }
    }
    
}

