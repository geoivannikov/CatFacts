//
//  APIError.swift
//  CatFacts
//
//  Created by George Ivannikov on 25.07.2021.
//

import Foundation

enum APIError: Error {
    case responseError
    case decodingError
    case noConnectionError
    case unknownError
}

extension APIError: LocalizedError {
    var description: String? {
        switch self {
        case .responseError:
            return "Response error"
        case .decodingError:
            return "Decoding failed"
        case .noConnectionError:
            return "No internet connection. Establish connection and relaunch the application"
        case .unknownError:
            return "Unknown error"
        }
    }
}
