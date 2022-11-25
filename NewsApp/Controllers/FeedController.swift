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
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Feed"
        createUI()
        layout()
    }
    
    //MARK: - Helpers
    
    private func createUI() {
        view.addSubview(searchTextField)
        view.addSubview(notificationButton)
        view.addSubview(article)
    }
    
    private func layout() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(40)
        }
        
        notificationButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchTextField.snp.centerY)
            make.leading.equalTo(searchTextField.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-15)
            make.width.height.equalTo(24)
        }
        
        article.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.leading.equalTo(searchTextField.snp.leading)
            make.trailing.equalToSuperview().offset(-15)
        }
    }
    
    //MARK: - Selectors
    
    @objc func handleNotification() {
        debugPrint("Notification")
    }
}
