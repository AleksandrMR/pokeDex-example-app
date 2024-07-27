//
//  RequestError.swift
//
//
//  Created by Aleksandr Milashevski on 26/07/24.
//

import Foundation

public enum RequestError: Error {
    case decode
    case encodeBody
    case invalidURL
    case noResponse
    case messageCode(String?)
    case unknown
}
