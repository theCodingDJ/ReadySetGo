//
//  ReadySetGoUITests.swift
//  ReadySetGoUITests
//
//  Created by Lyubomir Marinov on 1.09.24.
//

import XCTest

final class ReadySetGoUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()

    }

    override func tearDownWithError() throws {
        app = nil
    }

    /// This tests verifies the following:
    ///
    /// * Text field existence.
    /// * Text field placeholder.
    /// * Button existence.
    /// * Button title (i.e. the button's label)
    ///
    func testFirstScreensComponents() throws {
        let carModelTextField = app.textFields["CarModelTextField"]
        let startDrivingButton = app.buttons["CarModelSubmitButton"]
        
        /// Text field existence.
        XCTAssertTrue(carModelTextField.exists, "The text field is missing.")

        /// Text field placeholder.
        let placeholder = try XCTUnwrap(carModelTextField.placeholderValue)
        XCTAssertEqual(placeholder, "Car Model", "Placeholder doesn't match.")
        
        /// Button existence.
        XCTAssertTrue(startDrivingButton.exists, "The button is missing.")
        
        /// Button label.
        let buttonLabel = try XCTUnwrap(startDrivingButton.label)
        XCTAssertEqual(buttonLabel, "Start Driving", "Button label doesn't match.")
        
    }
    
    /// This test performs the following scenario:
    ///
    /// 1. Open the app.
    /// 2. Tap the button with empty text field.
    /// 3. Check if the error alert is presented.
    ///
    func testFirstScreenEmptyTextFieldFailure() throws {
        
        /// Tap the *Start Driving* button.
        ///
        /// - Note: We still need to verify the button existence.
        ///
        let startDrivingButton = app.buttons["CarModelSubmitButton"]
        XCTAssertTrue(startDrivingButton.exists, "The button is missing.")
        startDrivingButton.tap()
        
        /// Observe the alert.
        let errorAlert = app.alerts.firstMatch
        XCTAssertTrue(errorAlert.waitForExistence(timeout: 3), "The error alert should be presented.")
    }
    
    /// This test performs the following scenario:
    ///
    /// 1. Open the app.
    /// 2. Add an invalid `(lenght < 3)` value to  the text field, e.g. **"DS"**
    /// 3. Tap the button.
    /// 4. Check if the error alert is presented.
    ///
    func testFirstScreenInvalidTextFieldFailure() throws {

        /// Focus on the *Car Model* text field.
        ///
        /// - Note: We still need to verify the text field existence.
        ///
        let carModelTextField = app.textFields["CarModelTextField"]
        XCTAssertTrue(carModelTextField.exists, "The text field is missing.")
        carModelTextField.tap()
        carModelTextField.typeText("DS")

        /// Tap the *Start Driving* button.
        ///
        /// - Note: We still need to verify the button existence.
        ///
        let startDrivingButton = app.buttons["CarModelSubmitButton"]
        XCTAssertTrue(startDrivingButton.exists, "The button is missing.")
        startDrivingButton.tap()
        
        /// Observe the alert.
        let errorAlert = app.alerts.firstMatch
        XCTAssertTrue(errorAlert.waitForExistence(timeout: 3), "The error alert should be presented.")
    }
    
    /// This test performs the following scenario:
    ///
    /// 1. Open the app.
    /// 2. Add a valid `(lenght >= 3)` value to  the text field, e.g. **"BMW"**
    /// 3. Tap the button.
    /// 4. Check if the title is correct and the traffic signal view exists.
    ///
    func testFirstScreenTextFieldSuccess() throws {
        
        /// Focus on the *Car Model* text field.
        ///
        /// - Note: We still need to verify the text field existence.
        let carModelTextField = app.textFields["CarModelTextField"]
        XCTAssertTrue(carModelTextField.exists, "The text field is missing.")
        carModelTextField.tap()
        carModelTextField.typeText("BMW")

        /// Tap the *Start Driving* button.
        ///
        /// - Note: We still need to verify the button existence.
        ///
        let startDrivingButton = app.buttons["CarModelSubmitButton"]
        XCTAssertTrue(startDrivingButton.exists, "The button is missing.")
        startDrivingButton.tap()
        
        /// Verify the title eixstence.
        let startDrivingTitle = app.staticTexts["Car Model: BMW"]
        XCTAssertTrue(startDrivingTitle.waitForExistence(timeout: 3), "The start driving screen should be displayed.")

        /// Verify the traffic signal view existence.
        let trafficSignalView = app.otherElements["TrafficSignalView"]
        XCTAssertTrue(trafficSignalView.exists, "The traffic signal view is missing.")
    }
}
