//
//  FilterCell.swift
//  NewsApp
//
//  Created by Mikhail Kolkov on 11/25/22.
//

import UIKit
import SnapKit

//class FilterCell : UICollectionViewCell {
//
//    private let filter = NAPaddingTextView()
//
//    var data: CustomData? {
//        didSet {
//            guard let data = data else { return }
//            filter.text = data.title
//
//        }
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        UI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func UI() {
//        addSubview(filter)
//
//        filter.padding = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
//        filter.layer.borderColor = R.Colors.gray2?.cgColor
//        filter.layer.borderWidth = 1
//        filter.backgroundColor = .white
//        filter.layer.cornerRadius = 6
//        filter.font = R.Fonts.regular(with: 14)
//        filter.textColor = R.Colors.secondaryText
//
//        filter.snp.makeConstraints { make in
//            make.top.bottom.leading.trailing.equalToSuperview()
//        }
//    }
//}
