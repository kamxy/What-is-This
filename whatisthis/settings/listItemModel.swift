//
//  listItemModel.swift
//  whatisthis
//
//  Created by Mehmet Kamay on 5.09.2024.
//

import Foundation

struct ListItem: Identifiable {
    let id = UUID()
    let emoji: String
    let title: String
    var subtitle: String?
    var isLanguageSelector: Bool = false
    
    init(emoji: String, title: String, subtitle: String? = nil, isLanguageSelector: Bool = false) {
        self.emoji = emoji
        self.title = title
        self.subtitle = subtitle
        self.isLanguageSelector = isLanguageSelector
    }
}
