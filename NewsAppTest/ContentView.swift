//
//  ContentView.swift
//  NewsAppTest
//
//  Created by Mikhail Kolkov  on 23.08.2021.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import WebKit

struct ContentView: View {
    @ObservedObject var newsList = getNews()
    
    var body: some View {
        NavigationView {
            VStack {
                List(newsList.news) {new in
                    NavigationLink(
                        destination: webView(url: new.url)) {
                        NewView(title: new.title, description: new.description, image: new.image)
                    }
                }
            }
                .navigationTitle("Новости")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
