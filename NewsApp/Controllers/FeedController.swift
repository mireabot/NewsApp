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
    }
    
    private func layout() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(40)
        }
    }
    
    //MARK: - Selectors
}

