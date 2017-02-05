# ListenerManagerGenerator

This is an experimental repository for [Sourcery](https://github.com/krzysztofzablocki/Sourcery) stencil template for generating listener managers.

Let's say you have a `Service` class. This `Service` issues different events during its lifetime.
The list of events can be expressed as a protocol or an enum.
In this repo I wanted to explore the protocol option.

The events list protocol: `ServiceEventListener`

```swift
protocol ServiceEventListener: class {
    func connectionStateChanged(_ state: ServiceConnectionState)

    func serviceEvent1(event1: ServiceEvent1)

    func serviceEvent2(event2: ServiceEvent2, additionalContext: Context)

    func serviceReset()
}
```

Our `Service` should support multiple listeners, so we need to keep an array of listeners.
When an event occurs, we run through the list of listeners and invoke a corresponding method.
If we have lots of events and services - we will have to write a lot boilerplate code.

In Objective-C we could implement it via delegate proxies (refer to this article for more details: [Smart Proxy Delegation](http://petersteinberger.com/blog/2013/smart-proxy-delegation/)).

In Swift we can generate all the boilerplate using [Sourcery](https://github.com/krzysztofzablocki/Sourcery).

[This stencil template](/ListenerManagerGenerator/Templates/AutoListenerManager.stencil) generates the following code (`container` is a helper class that manages the list of listeners)
```swift
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
```
