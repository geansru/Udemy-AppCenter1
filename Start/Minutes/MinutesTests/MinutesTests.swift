//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Dmitriy Roytman on 24.06.2018.
//  Copyright © 2018 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
    
    private struct EntryUnderTest {
        static let title = "Title"
        static let content = "Content"
        
        private init() { /* Do nothing */ }
        
        static func makeEntryUnderTest() -> Entry {
            return Entry(title, content)
        }
    }
    
    private var entryUnderTest: Entry?
    
    override func setUp() {
        super.setUp()
        entryUnderTest = EntryUnderTest.makeEntryUnderTest()
    }
    
    override func tearDown() {
        entryUnderTest = nil
        super.tearDown()
    }
    
    func testSerialization() {
        let serializedData = FileEntryStore.serialize(entryUnderTest!)
        let entry = FileEntryStore.deserialize(serializedData!)
        
        XCTAssertEqual(entry?.title, EntryUnderTest.title, "Title does not match")
        XCTAssertEqual(entry?.content, EntryUnderTest.content, "Content does not match")
    }
    
}
