//
//  listItemModel.swift
//  whatisthis
//
//  Created by Mehmet Kamay on 5.09.2024.
//

import Foundation

struct ListItem{
    let emoji:String
    let title:String
    var subtitle:String?
    
    init(emoji: String, title: String, subtitle: String? = nil) {
          self.emoji = emoji
          self.title = title
          self.subtitle = subtitle
      }
}
