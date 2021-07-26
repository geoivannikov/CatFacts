//
//  CatImageResponse.swift
//  CatFacts
//
//  Created by George Ivannikov on 26.07.2021.
//

import Foundation

struct CatImageResponse {
    let url: String
}

extension CatImageResponse: Decodable { }
