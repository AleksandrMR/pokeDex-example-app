//
//  NetworkHelpers.swift
//
//
//  Created by Aleksandr Milashevski on 27/07/24.
//

import Foundation

struct NetworkHelpers {
    
    static var session: URLSession {
        sessionDefault
    }
    
    private static var sessionDefault: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 60
        return URLSession(configuration: configuration)
    }
}
