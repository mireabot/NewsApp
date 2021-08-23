//
//  FetchNews.swift
//  NewsAppTest
//
//  Created by Mikhail Kolkov  on 23.08.2021.
//

import Foundation
import SwiftyJSON

struct New : Identifiable {
    var id = UUID()
    var title : String
    var description: String
    var image: String
    var url: String
}

class getNews : ObservableObject{
    
    @Published var news = [New]()
    
    init() {
        
        let source = "http://newsapi.org/v2/top-headlines?country=us&apiKey=9fde62f75f974ac3b874e6f5b8757041"
        
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, _, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            for new in json["articles"]{
                let title = new.1["title"].stringValue
                let description = new.1["description"].stringValue
                let image = new.1["urlToImage"].stringValue
                let url = new.1["url"].stringValue
                
                DispatchQueue.main.async {
                    self.news.append(New(id: UUID(), title: title, description: description, image: image, url: url))
                }
                

            }
            
            
    
        }.resume()
    }
    
}

