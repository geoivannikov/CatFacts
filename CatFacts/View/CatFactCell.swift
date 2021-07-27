//
//  CatFactCell.swift
//  CatFacts
//
//  Created by George Ivannikov on 25.07.2021.
//

import Foundation
import UIKit
import SnapKit

final class CatFactCell: UITableViewCell {
    let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
    }

    private func setUpLayout() {
        selectionStyle = .none
        isUserInteractionEnabled = false
        backgroundColor = .clear

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(10)
            $0.trailing.bottom.equalToSuperview().offset(-10)
            $0.height.equalTo(130)
        }
        
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(5)
            $0.trailing.bottom.equalToSuperview().offset(-5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
