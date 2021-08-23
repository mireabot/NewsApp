//
//  NewsCellView.swift
//  NewsAppTest
//
//  Created by Mikhail Kolkov  on 23.08.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewView: View {
    let title: String
    let description: String
    let image: String
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .fontWeight(.heavy)
                Text(description).lineLimit(2)
            }
            
            if image != "" {
                WebImage(url: URL(string: image))
                    .resizable()
                    .frame(width: 110, height: 135)
                    .cornerRadius(20)
            }
        }.padding(.vertical, 10)
  
    }
}


