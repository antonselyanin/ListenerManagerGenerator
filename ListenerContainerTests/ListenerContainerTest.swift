//
//  ListenerManagerTests.swift
//  ListenerManagerTests
//
//  Created by Anton Selyanin on 05/02/2017.
//  Copyright © 2017 Anton Selyanin. All rights reserved.
//

import XCTest
@testable import ListenerContainer

class ListenerContainerTest: XCTestCase {
    private var container: ListenerContainer<ListenerProtocol>!
    
    override func setUp() {
        super.setUp()
        container = ListenerContainer()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_AllowsOnlyOneUniqueInstance() {
        // Given
        let listener = Listener()
        
        // When
        container.addListener(listener)
        container.addListener(listener)
        
        var listeners: [ListenerProtocol] = []
        container.forEach { l in
            listeners.append(l)
        }
        
        // Then
        XCTAssertEqual(listeners.count, 1)
        XCTAssertTrue((listeners.first! as AnyObject) === listener)
    }
    
    func test_RemoveListener() {
        // Given
        let listener = Listener()
        let listener2 = Listener()
        container.addListener(listener)
        container.addListener(listener2)
        
        // When
        container.removeListener(listener)
        var listeners: [ListenerProtocol] = []
        container.forEach { l in
            listeners.append(l)
        }
        
        // Then
        XCTAssertEqual(listeners.count, 1)
        XCTAssertTrue((listeners.first! as AnyObject) === listener2)
    }
    
    func test_ListenersAreWeaklyHeld() {
        // Given
        var listener: Listener? = Listener()
        let weakRef = WeakBox(listener!)
        container.addListener(listener!)
        
        // When
        listener = nil
        
        // Then
        XCTAssertNil(weakRef.object)
    }
}

private protocol ListenerProtocol: class {
    func method(parameter: String)
}

private class Listener: ListenerProtocol {
    func method(parameter: String) {}
}
