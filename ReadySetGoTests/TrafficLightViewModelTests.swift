//
//  TrafficLightViewModelTests.swift
//  ReadySetGoTests
//
//  Created by Lyubomir Marinov on 1.09.24.
//

import XCTest
@testable import ReadySetGo

final class TrafficLightViewModelTests: XCTestCase {
    
    var viewModel: TrafficLightViewModel!

    override func setUpWithError() throws {
        viewModel = TrafficLightViewModel()
    }

    override func tearDownWithError() throws {
        viewModel.stopTrafficSignaling()
        viewModel = nil
    }

    func testInitialLightIsRed() {
        XCTAssertEqual(viewModel.currentSignal.identifier, .red, "The initial traffic light should be red.")
    }
    
    func testLightCycleChangesToGreenAfterRed() {
        let expectation = XCTestExpectation(description: "Light changes to green after 4 seconds.")
        
        viewModel.startTrafficSignaling()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            XCTAssertEqual(self.viewModel.currentSignal.identifier, .green, "The light should change to green after red.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLightCycleChangesToOrangeAfterGreen() {
        let expectation = XCTestExpectation(description: "Light changes to orange after 4 seconds.")
        
        /// Manually set to green to override the default value.
        viewModel.currentSignal = ClassicTrafficLights.green
        viewModel.startTrafficSignaling()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            XCTAssertEqual(self.viewModel.currentSignal.identifier, .orange, "The light should change to orange after green.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLightCycleChangesToRedAfterOrange() {
        let expectation = XCTestExpectation(description: "Light changes to red after 1 second.")
        
        /// Manually set to orange to override the default value.
        viewModel.currentSignal = ClassicTrafficLights.orange
        viewModel.startTrafficSignaling()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertEqual(self.viewModel.currentSignal.identifier, .red, "The light should change back to red after orange.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
