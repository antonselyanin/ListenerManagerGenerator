//
// Created by Anton Selyanin on 04/02/2017.
// Copyright (c) 2017 Anton Selyanin. All rights reserved.
//

import Foundation

struct Event1 {}
struct Event2 {}

protocol ExampleListener: class, AutoListenerManageable {
    func notify1(event1: Event1)

    func notify2(event2: Event2)

    func notify3()

    func notify4(event1: Event1, event2: Event2)

    func notify5(_ event1: Event1, event2 theEvent: Event2)
}
