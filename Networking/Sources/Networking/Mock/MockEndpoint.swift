//
//  MockEndpoint.swift
//
//
//  Created by Aleksandr Milashevski on 29/07/24.
//

import Foundation

struct MockEndpoint: EndpointProvider {
    var scheme: String = "https"
    var host: String = "example.com"
    var path: String = "/test"
    var method: RequestMethod = .get
    var queryItems: [URLQueryItem]? = nil
    var body: [String: Any]? = nil
    var mockFile: String? = nil
}
