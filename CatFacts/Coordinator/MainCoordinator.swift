//
//  MainCoordinator.swift
//  CatFacts
//
//  Created by George Ivannikov on 26.07.2021.
//

import Foundation
import UIKit

final class MainCoordinator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CatFactsViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func presentError(error: APIError) {
        let alert = UIAlertController(title: "Error", message: error.description, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        navigationController.present(alert, animated: true)
    }
}
