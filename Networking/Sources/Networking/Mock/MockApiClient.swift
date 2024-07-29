//
//  MockApiClient.swift
//
//
//  Created by Aleksandr Milashevski on 29/07/24.
//

import Foundation

public class MockApiClient: Mockable, ApiProtocol {
    
    // MARK: - Var
    var sendError: Bool
    var mockFile: String?
    
    // MARK: - Initialization func
    public init(sendError: Bool = false,
                mockFile: String? = nil) {
        self.sendError = sendError
        self.mockFile = mockFile
    }
    
    // MARK: - Flow funcs
    public func sendRequest<T>(endpoint: any EndpointProvider, responseModel: T.Type) async throws -> T where T : Decodable {
        if sendError {
            throw RequestError.messageCode("MockApiClient: AsyncFailed")
        } else {
            let filename = mockFile ?? endpoint.mockFile!
            return loadJSON(filename: filename, type: responseModel.self)
        }
    }
}
