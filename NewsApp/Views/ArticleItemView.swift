//
//  ReadingItemFeedView.swift
//  NewsApp
//
//  Created by Mikhail Kolkov on 11/25/22.
//

import UIKit
import SnapKit

class ArticleItemView: UIView {
    //MARK: - Properties
    
    private let articleImage : UIImageView = {
        let iv = UIImageView()
        iv.image = R.Images.articleDemo
        iv.layer.cornerRadius = 16
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    private let authourLabel : NAPaddingTextView = {
        let tv = NAPaddingTextView()
        tv.padding = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        tv.backgroundColor = R.Colors.secondaryGray
        tv.text = "ABC News"
        tv.layer.cornerRadius = 5
        tv.layer.masksToBounds = true
        tv.font = R.Fonts.regular(with: 10)
        
        return tv
    }()
    
    private let articleTitle: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.bold(with: 15)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Augmented Reality Trends for 2022"
        
        return label
    }()
    
    private let articleDate: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.regular(with: 10)
        label.textColor = R.Colors.secondaryText
        label.textAlignment = .right
        label.text = "Jan 4, 2022"
        
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
        createLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func createUI() {
        addSubview(articleImage)
        addSubview(articleTitle)
        addSubview(articleDate)
        addSubview(authourLabel)
    }
    
    private func createLayout() {
        articleImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.leading.equalToSuperview()
            make.width.equalTo(96)
            make.height.equalTo(79)
        }
        
        authourLabel.snp.makeConstraints { make in
            make.top.equalTo(articleImage)
            make.leading.equalTo(articleImage.snp.trailing).offset(10)
        }
        
        articleTitle.snp.makeConstraints { make in
            make.bottom.equalTo(articleImage.snp.bottom)
            make.leading.equalTo(articleImage.snp.trailing).offset(5)
            make.trailing.equalTo(articleDate.snp.trailing)
        }
        
        articleDate.snp.makeConstraints { make in
            make.centerY.equalTo(authourLabel.snp.centerY)
            make.trailing.equalToSuperview()
        }
    }
    
    //MARK: - Selectors
}

