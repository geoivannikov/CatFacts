//
//  CatFactResponse.swift
//  CatFacts
//
//  Created by George Ivannikov on 28.07.2021.
//

import Foundation

struct CatFactResponse {
    let text: String
}

extension CatFactResponse: Decodable { }
