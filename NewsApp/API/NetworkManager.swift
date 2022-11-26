//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Mikhail Kolkov on 11/25/22.
//

import Foundation
import Alamofire

class NetworkManager {
    static var shared = NetworkManager()
    
    func fetchNews(byWord word: String, completion: @escaping(Result<[Article], Error>)-> Void) {
        let url = "https://newsapi.org/v2/everything?q=\(word)&from=\(Date().makeStringforAPI())&sortBy=publishedAt&apiKey=d3e42ab2752e47b29d24f1d85c29f4e7"
        AF.request(url).responseDecodable(of: APIResponse.self, queue: .main, decoder: JSONDecoder()){ (response) in
            switch response.result {
            case .success(let data):
                completion(.success(data.articles))
                debugPrint(data.articles)
            case .failure(let error):
                print(error)
            }
        }
    }
}
