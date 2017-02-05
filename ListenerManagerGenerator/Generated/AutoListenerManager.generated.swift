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

