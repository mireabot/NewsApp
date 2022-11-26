//
//  ArticleViewController.swift
//  NewsApp
//
//  Created by Mikhail Kolkov on 11/25/22.
//

import UIKit
import SnapKit
import SDWebImage
import SafariServices

class ArticleViewController: UIViewController {
    //MARK: - Properties
    
    private let articleImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.image = R.Images.articleDemo
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    private let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = R.Fonts.bold(with: 20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "New VR Headsets That Will Shape the Metaverse"
        
        return label
    }()
    
    private let articlePublishedLabel: NAPaddingTextView = {
        let label = NAPaddingTextView()
        label.padding = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        label.backgroundColor = R.Colors.secondaryGray
        label.text = "ABC News"
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.font = R.Fonts.regular(with: 14)
        
        return label
    }()
    
    private let articleAuthorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = R.Fonts.regular(with: 14)
        label.text = "By Michael K"
        
        return label
    }()
    
    private let articleDateLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.regular(with: 14)
        label.textColor = R.Colors.secondaryText
        label.textAlignment = .right
        label.text = "Jan 4, 2022"
        
        return label
    }()
    
    private let articleContent: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.regular(with: 16)
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id sit eu tellus sed cursus eleifend id porta. Lorem adipiscing mus vestibulum consequat porta eu ultrices feugiat. Et, faucibus ut amet turpis. Facilisis faucibus semper cras purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id sit eu tellus sed cursus eleifend id porta. Lorem adipiscing mus vestibulum consequat porta eu ultrices feugiat. Et, faucibus ut amet turpis. Facilisis faucibus semper cras purus."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    private var redirectLink: String = ""
    
    private var redirectButton : UIButton = {
        let button = UIButton()
        button.setTitle("Read full article", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = R.Colors.primary
        button.layer.cornerRadius = 10
        button.titleLabel?.font = R.Fonts.regular(with: 17)
        button.addTarget(self, action: #selector(handleRedirect), for: .touchUpInside)
        
        return button
    }()
    
    var newsData : NewsViewModel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createNavBar()
        createUI()
        createLayout()
    }
    
    //MARK: - Helpers
    
    private func createUI() {
        view.addSubview(articleImage)
        view.addSubview(articleTitleLabel)
        view.addSubview(articlePublishedLabel)
        view.addSubview(articleAuthorLabel)
        view.addSubview(articleContent)
        view.addSubview(articleDateLabel)
        view.addSubview(redirectButton)
    }
    
    private func createLayout() {
        articleImage.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(200)
        }
        
        articlePublishedLabel.snp.makeConstraints { make in
            make.top.equalTo(articleImage.snp.bottom).offset(15)
            make.leading.equalTo(articleImage)
            make.height.equalTo(30)
        }
        
        articleDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(articlePublishedLabel)
            make.trailing.equalTo(articleImage)
        }
        
        articleTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(articlePublishedLabel.snp.bottom).offset(12)
            make.leading.equalTo(articleImage)
            make.trailing.equalTo(articleImage)
        }
        
        articleAuthorLabel.snp.makeConstraints { make in
            make.top.equalTo(articleTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(articleImage)
        }
        
        articleContent.snp.makeConstraints { make in
            make.top.equalTo(articleAuthorLabel.snp.bottom).offset(12)
            make.leading.equalTo(articleImage)
            make.trailing.equalTo(articleImage)
        }
        
        redirectButton.snp.makeConstraints { make in
            make.top.equalTo(articleContent.snp.bottom).offset(20)
            make.leading.equalTo(articleImage)
            make.trailing.equalTo(articleImage)
            make.height.equalTo(44)
        }
    }
    
    private func createNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(handleDismiss))
    }
    
    func configure(withData data: NewsViewModel) {
        articleTitleLabel.text = data.title
        articleContent.text = data.content
        articlePublishedLabel.text = data.publisher
        articleDateLabel.text = data.publishDate
        articleAuthorLabel.text = "By \(data.author)"
        articleImage.sd_setImage(with: data.imageURL)
        redirectLink = data.articleURL
    }
    
    //MARK: - Selectors
    
    @objc func handleDismiss() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleRedirect() {
        let controller = SFSafariViewController(url: URL(string: redirectLink)!)
        present(controller, animated: true)
    }
}

