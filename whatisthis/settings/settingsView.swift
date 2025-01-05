//
//  settingsView.swift
//  whatisthis
//
//  Created by Mehmet Kamay on 5.09.2024.
//

import SwiftUI

struct settingsView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage: String = Language.english.rawValue
    private let localizedStrings = LocalizedStrings.shared
    
    let items = [
        ListItem(emoji: "🌎", title: "Language", subtitle: "Change app language", isLanguageSelector: true),
        ListItem(emoji: "🤩", title: "Rate App", subtitle: "Support us with 5 stars"),
        ListItem(emoji: "𝕏", title: "Follow Us", subtitle: "@builtwithswift")
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                if item.isLanguageSelector {
                    Section {
                        Picker("Select Language", selection: $selectedLanguage) {
                            ForEach(Language.allCases, id: \.rawValue) { language in
                                Text(languageName(for: language))
                                    .tag(language.rawValue)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    } header: {
                        listItemView(item: item)
                    }
                } else if item.emoji == "𝕏" {
                    Link(destination: URL(string: "https://x.com/builtwithswift")!) {
                        listItemView(item: item)
                    }
                } else {
                    Button {
                        if item.emoji == "🤩" {
                            if let url = URL(string: "itms-apps://itunes.apple.com/app/YOUR-APP-ID") {
                                UIApplication.shared.open(url)
                            }
                        }
                    } label: {
                        listItemView(item: item)
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
    
    private func languageName(for language: Language) -> String {
        switch language {
        case .english:
            return "English 🇺🇸"
        case .german:
            return "Deutsch 🇩🇪"
        case .turkish:
            return "Türkçe 🇹🇷"
        case .spanish:
            return "Español 🇪🇸"
        case .japanese:
            return "日本語 🇯🇵"
        case .portuguese:
            return "Português 🇧🇷"
        }
    }
}

#Preview {
    settingsView()
}
