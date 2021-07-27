//
//  CatFactsViewModel.swift
//  CatFacts
//
//  Created by George Ivannikov on 26.07.2021.
//

import Foundation
import PromiseKit

protocol CatFactsViewModelProtocol {
    func fetchData() -> Promise<(imageURL: String, facts: [String])>
}

final class CatFactsViewModel: CatFactsViewModelProtocol {
    private let apiManager: ApiManagerProtocol
    
    init(apiManager: ApiManagerProtocol = ApiManager()) {
        self.apiManager = apiManager
    }

    func fetchData() -> Promise<(imageURL: String, facts: [String])> {
        Promise { seal in
            firstly {
                when(fulfilled: apiManager.fetchData(url: Constants.catImageURL) as Promise<CatImageResponse>,
                     apiManager.fetchData(url: Constants.catFactsURL) as Promise<[CatFactResponse]>)
            }.done { catImageResponse, catFactResponse in
                seal.fulfill((catImageResponse.url, catFactResponse.map(\.text)))
            }.catch { error in
                seal.reject(error)
            }
        }
    }
}
