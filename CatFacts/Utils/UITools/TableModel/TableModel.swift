//
//  TableModel.swift
//  CatFacts
//
//  Created by George Ivannikov on 27.07.2021.
//

import Foundation
import UIKit

final class TableModel {
    var sections: [TableSection] = []
    var cells: [CellRegister] = []
    
    func registerCells(for tableView: UITableView) {
        cells.forEach { tableView.register($0.cellType, forCellReuseIdentifier: $0.cellIdentifier) }
    }

    func rows(in sectionNumber: Int) -> Int? {
        sections[safe: sectionNumber]?.rows.reduce(0, { $0 + $1.size })
    }
    
    func row(on indexPath: IndexPath) -> TableRow? {
        sections[safe: indexPath.section]?.rows[safe: absoluteRowIndex(on: indexPath)]
    }
    
    private func absoluteRowIndex(on indexPath: IndexPath) -> Int {
        var rowIndex = 0
        var ret = 0
        for (index, element) in sections[indexPath.section].rows.enumerated() {
            ret = index
            rowIndex += element.size
            if rowIndex > indexPath.row && element.size != 0 {
                break
            }

        }
        return ret
    }
}
