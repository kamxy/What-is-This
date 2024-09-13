//
//  settingsView.swift
//  whatisthis
//
//  Created by Mehmet Kamay on 5.09.2024.
//

import SwiftUI

struct settingsView: View {
    
    let items:[ListItem] = [
//        ListItem(emoji: "🤩", title: "Get Pro",subtitle: "Support an indie developer"),
//        ListItem(emoji: "🌗", title: "Apperance"),
//       
//        ListItem(emoji: "⭐️", title: "Do you like the app?", subtitle: "Your review would help a lot!"),
        ListItem(emoji: "🔒", title: "Privacy Policy"),
        ListItem(emoji: "📕", title: "Terms and Conditions"),
        ListItem(emoji: "𝕏", title: "Connect on Twitter/𝕏",subtitle: "@builtwithswift"),

    ]
    var body: some View {
        
        VStack {
           
            List {
                   
//                    Section{
//                        
//                        ForEach(0..<1,id: \.self){
//                            index in
//                        listItemView(item: items[index])
//                        }
//                    }
//                    Section{
//                        
//                        ForEach(1..<3,id: \.self){
//                            index in
//                        listItemView(item: items[index])
//                        }
//                    }
                    Section{
                        
                        ForEach(0..<2,id: \.self){
                            index in
                            Link(destination:URL(string: "https://firebasestorage.googleapis.com/v0/b/kamay-quote-app.appspot.com/o/policies%2Fwhat-is-this-privacy.html?alt=media&token=f1901e65-acd2-4110-92d3-084ece2a1774")!)  {
                                listItemView(item: items[index])

                            }
                        }
                    }

                    Section{
                        
                        ForEach(2..<3,id: \.self){
                            index in
                            Link(destination:URL(string: "https://x.com/builtwithswift")!)  {
                                listItemView(item: items[index])

                            }                      }
                    }


                   
            }
        }.navigationTitle("Settings")
        
    }
}



#Preview {
    settingsView()
}
