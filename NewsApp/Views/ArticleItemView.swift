//
//  ReadingItemFeedView.swift
//  NewsApp
//
//  Created by Mikhail Kolkov on 11/25/22.
//

import UIKit
import SnapKit
import SDWebImage

class NewsViewModel {
    let title: String
    let content: String
    let publisher: String
    let publishDate: String
    let imageURL: URL?
    var imageData: Data? = nil
    let author: String
    let articleURL: String
    
    init(title: String, content: String, publisher: String, publishDate: String, imageURL: URL?, author: String, articleURL: String) {
        self.title = title
        self.content = content
        self.publisher = publisher
        self.publishDate = publishDate
        self.imageURL = imageURL
        self.author = author
        self.articleURL = articleURL
    }
}

class ArticleItemView: UITableViewCell {
    //MARK: - Properties
    
    private let articleImage : UIImageView = {
        let iv = UIImageView()
        iv.image = R.Images.articleDemo
        iv.layer.cornerRadius = 16
        iv.contentMode = .scaleAspectFill
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
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 3
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
        createLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureData(with news: NewsViewModel) {
        articleTitle.text = news.title
        authourLabel.text = news.publisher
        articleDate.text = news.publishDate
        
        if let data = news.imageData {
            articleImage.image = UIImage(data: data)
        }
        else if let url = news.imageURL {
            DispatchQueue.main.async {
                self.articleImage.sd_setImage(with: url)
            }
        }
        else {
            articleImage.image = R.Images.articleDemo
        }
    }
    
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
            make.top.equalTo(authourLabel.snp.bottom).offset(10)
            make.leading.equalTo(articleImage.snp.trailing).offset(10)
            make.trailing.equalTo(articleDate.snp.trailing)
//            make.bottom.equalTo(articleImage.snp.bottom).offset()
        }
        
        articleDate.snp.makeConstraints { make in
            make.centerY.equalTo(authourLabel.snp.centerY)
            make.trailing.equalToSuperview()
        }
    }
    
    //MARK: - Selectors
}

