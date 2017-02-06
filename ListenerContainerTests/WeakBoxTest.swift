//
//  WeakBoxTest.swift
//  ListenerManagerGenerator
//
//  Created by Anton Selyanin on 06/02/2017.
//  Copyright © 2017 Anton Selyanin. All rights reserved.
//

import XCTest
@testable import ListenerContainer

class WeakBoxTest: XCTestCase {
    func test() {
        var c: C? = C()
        let weakC: WeakBox<C> = WeakBox(c!)
        
        XCTAssertNotNil(weakC.object)
        
        c = nil
        
        XCTAssertNil(weakC.object)
    }
}

private class C {}
