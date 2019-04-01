//
//  GalleriaUITests.swift
//  GalleriaUITests
//
//  Created by Pramodya Abeysinghe on 1/4/19.
//  Copyright © 2019 Pramodya. All rights reserved.
//

import XCTest

class GalleriaUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test1ClickToViewDetails() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["Roads"].tap()
        app.navigationBars["Roads"].buttons["Galleria"].tap()
        
    }
    
    func test2AddNewPhotoItem() {
        
        let app = XCUIApplication()
        app.navigationBars["Galleria"].buttons["Add"].tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"Add New Photo").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0)
        element.children(matching: .textField).element(boundBy: 0).tap()
        
        let app2 = app
        let fKey = app2.keys["f"]
        let lKey = app2/*@START_MENU_TOKEN@*/.keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let oKey = app2/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let wKey = app2/*@START_MENU_TOKEN@*/.keys["w"]/*[[".keyboards.keys[\"w\"]",".keys[\"w\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let eKey = app2/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let rKey = app2/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let sKey = app2/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let doneButton = app2/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards.buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        fKey.tap()
        lKey.tap()
        oKey.tap()
        wKey.tap()
        eKey.tap()
        rKey.tap()
        sKey.tap()
        doneButton.tap()
        
        app2.otherElements.containing(.navigationBar, identifier:"Add New Photo").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .textField).element(boundBy: 1).tap()
        
        
        fKey.tap()
        lKey.tap()
        oKey.tap()
        wKey.tap()
        eKey.tap()
        rKey.tap()
        doneButton.tap()
      
        XCUIApplication().buttons["Save"].tap()
        
    }
    
    func test3EditPhotoItem() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["flowers"].tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"flowers").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0)
        element.children(matching: .textField).element(boundBy: 0).tap()
        
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        
        let doneButton = app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards.buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        doneButton.tap()
        
        element.children(matching: .textField).element(boundBy: 1).tap()
        deleteKey.tap()
        doneButton.tap()
        app.buttons["Update"].tap()
        
    }
    
    func test4DeletePhotoItem() {

        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["flowe"]/*[[".cells.staticTexts[\"flowe\"]",".staticTexts[\"flowe\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        XCUIApplication().tables.buttons["Delete"].tap()
    }
    
    func test5ClickToViewDetails() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["Roads"].tap()
        app.navigationBars["Roads"].buttons["Galleria"].tap()
        
    }
}
