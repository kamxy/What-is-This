//
//  listItemView.swift
//  whatisthis
//
//  Created by Mehmet Kamay on 5.09.2024.
//

import SwiftUI

struct listItemView: View {
    var item:ListItem
    var body: some View {
        HStack{
            Text(item.emoji).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding([.trailing],10).foregroundStyle(.black)
            VStack(alignment: .leading,spacing: 6){
                
                Text(item.title).font(.subheadline).bold().foregroundStyle(.black)
                if item.subtitle != nil {
                    Text(item.subtitle ?? "")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
            
        }.frame(height: 50)
    }
}

#Preview {
    listItemView(item: ListItem(emoji: "🤩", title: "Get Pro", subtitle: "Support an indie developer"))
}
