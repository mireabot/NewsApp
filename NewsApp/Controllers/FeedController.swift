//
//  FeedController.swift
//  NewsApp
//
//  Created by Mikhail Kolkov on 11/24/22.
//

import UIKit
import SnapKit

class FeedController: UIViewController {
    //MARK: - Properties
    
    private let searchTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search..."
        tf.font = R.Fonts.regular(with: 15)
        tf.textColor = R.Colors.secondaryText
        tf.layer.cornerRadius = 16
        tf.backgroundColor = R.Colors.secondaryGray
        tf.textColor = .black
        tf.addPaddingAndIcon(R.Images.search!.withTintColor(R.Colors.gray2!), padding: 15, isLeftView: true)
        
        return tf
    }()
    
    private let notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(R.Images.notification, for: .normal)
        button.addTarget(self, action: #selector(handleNotification), for: .touchUpInside)
        
        return button
    }()
    
    private let article = ArticleItemView()
    
    private let barTitle: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.bold(with: 15)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Latest news for \(Date().makeString())"
        
        return label
    }()
    
    private let newsTableView: UITableView = {
        let tv = UITableView()
        tv.register(ArticleItemView.self, forCellReuseIdentifier: "cell")
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        
        return tv
    }()
    
    private var newsData = [NewsViewModel]()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavBar()
        createUI()
        layout()
        fetchNews(byWord: "world")
    }
    
    //MARK: - Helpers
    
    private func fetchNews(byWord word: String) {
        NetworkManager.shared.fetchNews(byWord: word) { [weak self] result in
            switch result {
            case .success(let articleData):
                self?.newsData = articleData.compactMap({
                    NewsViewModel(title: $0.title ?? "Name", content: $0.description ?? "Nil", publisher: $0.source.name ?? "ABC News", publishDate: $0.publishedAt?.makeDate().makeString() ?? "Today", imageURL: URL(string: $0.urlToImage ?? "nil"), author: $0.author ?? "Article has no author", articleURL: $0.url ?? "")
                })
                
                DispatchQueue.main.async {
                    self?.newsTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barTitle)
    }
    
    private func createUI() {
        view.addSubview(searchTextField)
        view.addSubview(notificationButton)
        //        view.addSubview(article)
        view.addSubview(newsTableView)
        
        newsTableView.register(ArticleItemView.self, forCellReuseIdentifier: "cell")
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        searchTextField.delegate = self
    }
    
    private func layout() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(40)
        }
        
        notificationButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchTextField.snp.centerY)
            make.leading.equalTo(searchTextField.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-15)
            make.width.height.equalTo(24)
        }
        
        //        article.snp.makeConstraints { make in
        //            make.top.equalTo(searchTextField.snp.bottom).offset(10)
        //            make.leading.equalTo(searchTextField.snp.leading)
        //            make.trailing.equalToSuperview().offset(-15)
        //        }
        
        newsTableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.leading.equalTo(searchTextField.snp.leading)
            make.trailing.equalToSuperview().offset(-15)
            //            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: - Selectors
    
    @objc func handleNotification() {
        debugPrint("Notification")
    }
}

extension FeedController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ArticleItemView
        cell.configureData(with: newsData[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = newsData[indexPath.row]
        let contoller = ArticleViewController()
        contoller.configure(withData: data)
        navigationController?.pushViewController(contoller, animated: true)
    }
}


extension FeedController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NetworkManager.shared.fetchNews(byWord: textField.text ?? "world") { [weak self] result in
            switch result {
            case .success(let articleData):
                self?.newsData = articleData.compactMap({
                    NewsViewModel(title: $0.title ?? "Name", content: $0.description ?? "Nil", publisher: $0.source.name ?? "ABC News", publishDate: $0.publishedAt?.makeDate().makeString() ?? "Today", imageURL: URL(string: $0.urlToImage ?? "nil"), author: $0.author ?? "Article has no author", articleURL: $0.url ?? "")
                })
                
                DispatchQueue.main.async {
                    self?.newsTableView.reloadData()
                    textField.text = ""
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        self.view.endEditing(true)
        
        return true
    }
}
