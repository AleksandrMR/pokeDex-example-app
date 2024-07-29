//
//  HTTPClient.swift
//
//
//  Created by Aleksandr Milashevski on 26/07/24.
//

import UIKit
import Logger

protocol ApiProtocol {
    func sendRequest<T: Decodable>(endpoint: EndpointProvider, responseModel: T.Type) async throws -> T
}

public class  ApiClient: ApiProtocol {
    
    // MARK: - Initialization func
    public init() { }
    
    // MARK: - Flow funcs
    public func sendRequest<T: Decodable>(endpoint: EndpointProvider, responseModel: T.Type) async throws -> T {
        do {
            let request = try endpoint.urlRequest()
            let (data, response) = try await endpoint.session.data(for: request)
            return try self.manageResponse(data: data, request: request, response: response)
        } catch let error as RequestError {
            throw error
        } catch {
            throw RequestError.unknown
        }
    }
}

// MARK: - Extensions
extension ApiClient {
    private func manageResponse<T: Decodable>(data: Data, request: URLRequest, response: URLResponse) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            Logger.shared.printLog(request, logType: .response, .error)
            throw RequestError.noResponse
        }
        
        switch response.statusCode {
        case 200...299:
            do {
                Logger.shared.printLog(request, logType: .request, .success)
                Logger.shared.printLog(response, data, logType: .response, .success)
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                Logger.shared.printLog(request, logType: .request, .error)
                Logger.shared.printLog(response, data, logType: .response, .error)
                throw RequestError.decode
            }
        default:
            Logger.shared.printLog(request, logType: .request, .error)
            Logger.shared.printLog(response, data, logType: .response, .error)
            throw RequestError.unknown
        }
    }
}
