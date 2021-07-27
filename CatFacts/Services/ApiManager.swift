//
//  ApiManager.swift
//  CatFacts
//
//  Created by George Ivannikov on 25.07.2021.
//

import Foundation
import PromiseKit

protocol ApiManagerProtocol {
    func fetchData<T: Decodable>(url: String) -> Promise<T>
}

final class ApiManager: ApiManagerProtocol {
    func fetchData<T: Decodable>(url: String) -> Promise<T> {
        Promise { seal in
            guard let url = URL(string: url) else {
                seal.reject(APIError.urlError)
                return
            }
            URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                guard let data = data,
                      let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                    seal.reject(APIError.responseError)
                    return
                }
                do {
                    let articlesFromData = try JSONDecoder().decode(T.self, from: data)
                    seal.fulfill(articlesFromData)
                } catch {
                    seal.reject(APIError.decodingError)
                }
            }.resume()
        }
    }
}
