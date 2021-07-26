//
//  URLResponse.swift
//  CatFacts
//
//  Created by George Ivannikov on 26.07.2021.
//

import Foundation

struct URLResponse {
    let url: String
}

extension URLResponse: Decodable { }
