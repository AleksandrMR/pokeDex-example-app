//
//  EndpointProvider.swift
//
//
//  Created by Aleksandr Milashevski on 26/07/24.
//

import Foundation

public protocol EndpointProvider {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: [String: AnyObject]? { get }
    var session: URLSession { get }
    var mockFile: String? { get }
}

// MARK: - Extensions
extension EndpointProvider {
    public var scheme: String {
        "https"
    }
    
    public var host: String {
        "pokeapi.co"
    }
    
    public var header: [String: String]? {
        ["Content-Type":"application/json"]
    }
    
    public var method: RequestMethod {
        .get
    }
    
    public var queryItems: [URLQueryItem]? {
        nil
    }
    
    public var body: [String: AnyObject]? {
        nil
    }
    
    public var session: URLSession {
        NetworkHelpers.session
    }
    
    func urlRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host =  host
        urlComponents.path = path
        
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else {
            throw RequestError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = header
        
        if let body = body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                throw RequestError.encodeBody
            }
        }
        return request
    }
}
