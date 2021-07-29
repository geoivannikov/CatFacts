//
//  Collection+.swift
//  CatFacts
//
//  Created by George Ivannikov on 29.07.2021.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
