//
//  CatFactsViewController.swift
//  CatFacts
//
//  Created by George Ivannikov on 25.07.2021.
//

import UIKit
import SDWebImage
import PromiseKit

//https://i.thatcopy.pw/cat-webp/bvqlvmL.webp

final class CatFactsViewController: UITableViewController {
    override func viewDidLoad() {
        setUpLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          .lightContent
    }
    
    private func setUpLayout() {
        view.backgroundColor = .white
        tableView.tableFooterView = UIView()
        
        let image = UIImageView()
        guard let url = URL(string: "https://i.thatcopy.pw/cat-webp/bvqlvmL.webp") else { return }
        image.sd_setImage(with: url, placeholderImage: nil, options: [.continueInBackground, .progressiveLoad], completed: nil)
        image.center = view.center
        image.contentMode =  UIView.ContentMode.scaleAspectFill
        image.clipsToBounds = true
        
        tableView.backgroundView = image
        
        tableView.register(CatFactCell.self, forCellReuseIdentifier: "HistoryCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CatFactCell()
        return cell
    }
}
