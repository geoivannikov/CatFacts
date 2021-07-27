//
//  APIError.swift
//  CatFacts
//
//  Created by George Ivannikov on 25.07.2021.
//

import Foundation

enum APIError: Error {
    case urlError
    case responseError
    case decodingError
    case unknownError
}

extension APIError: LocalizedError {
    var description: String {
        switch self {
        case .urlError:
            return "Incorrect URL"
        case .responseError:
            return "Response error"
        case .decodingError:
            return "Decoding failed"
        case .unknownError:
            return "Unknown error"
        }
    }
}
