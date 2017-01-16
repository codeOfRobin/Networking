import Foundation
import XCTest

class UnauthorizedRequestCallbackTests: XCTestCase {
    let baseURL = "http://httpbin.org"

    func testUnauthorizedRequestCallback() {
        let networking = Networking(baseURL: baseURL)
        var callbackExecuted = false

        networking.unauthorizedRequestCallback = {
            callbackExecuted = true
        }

        networking.GET("/basic-auth/user/passwd") {
            JSON, error in
            XCTAssertNotNil(error)
            XCTAssertTrue(callbackExecuted)
        }
    }
}