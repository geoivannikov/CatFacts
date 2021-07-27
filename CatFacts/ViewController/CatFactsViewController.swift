//
//  CatFactsViewController.swift
//  CatFacts
//
//  Created by George Ivannikov on 25.07.2021.
//

import UIKit
import SDWebImage
import PromiseKit

final class CatFactsViewController: UITableViewController {
    weak var coordinator: MainCoordinator?

    private let viewModel: CatFactsViewModelProtocol
    private let tableModel = TableModel()
    private var backgroundImageURL: String? {
        didSet {
            let image = UIImageView()
            guard let url = URL(string: backgroundImageURL ?? "") else { return }
            image.sd_setImage(with: url, placeholderImage: nil, options: [.progressiveLoad], completed: nil)
            image.center = view.center
            image.contentMode =  UIView.ContentMode.scaleAspectFill
            image.clipsToBounds = true
            tableView.backgroundView = image
        }
    }
    private var facts: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    init(viewModel: CatFactsViewModelProtocol = CatFactsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          .lightContent
    }

    override func viewDidLoad() {
        setUpLayout()
        setUpTableModel()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func fetchData() {
        firstly {
            viewModel.fetchData()
        }.done { [weak self] data in
            self?.backgroundImageURL = data.imageURL
            self?.facts = data.facts
        }.catch(on: .main) { [weak self] error in
            if let error = error as? APIError {
                self?.coordinator?.presentError(error: error)
            }
        }
    }
    
    private func setUpLayout() {
        view.backgroundColor = .white
        tableView.tableFooterView = UIView()
    }
    
    private func setUpTableModel() {
//        tableModel.cells.append(CellRegister(cellType: CatFactCell.self, cellIdentifier: "CatFactCell"))
//        let catFactRow = TableRow(identifier: "catFactRow", type: CatFactCell.self)
//        let catFactSection = TableSection(identifier: "CatFactSection")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        facts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CatFactCell()
        cell.contentLabel.text = facts[indexPath.row]
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
