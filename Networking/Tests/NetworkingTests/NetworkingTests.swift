import XCTest
@testable import Networking

final class NetworkingTests: XCTestCase {
    func testAsURLRequest() throws {
        let mockEndpointProvider = MockEndpoint()
        let urlRequest = try? mockEndpointProvider.urlRequest()
        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest?.url?.absoluteString, "https://example.com/test")
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
        XCTAssertEqual(urlRequest?.allHTTPHeaderFields?["Content-Type"], "application/json")
    }
}
