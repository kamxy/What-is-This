import Foundation
import SwiftUI

enum Language: String, CaseIterable {
    case english = "en"
    case german = "de"
    case turkish = "tr"
    case spanish = "es"
    case japanese = "ja"
    case portuguese = "pt"
}

struct LocalizedStrings {
    static let shared = LocalizedStrings()

    let translations: [String: [Language: String]] = [
        "welcome_title": [
            .english: "Welcome to What Is This",
            .german: "Willkommen bei Was ist das",
            .turkish: "What is This'e Hoş Geldiniz",
            .spanish: "Bienvenido a Qué es Esto",
            .japanese: "What is This へようこそ",
            .portuguese: "Bem-vindo ao O que é Isto"
        ],
        "ai_assistant_description": [
            .english: "Your AI-powered visual assistant that helps you understand anything you see",
            .german: "Ihr KI-gestützter visueller Assistent, der Ihnen hilft, alles zu verstehen, was Sie sehen",
            .turkish: "Gördüğünüz her şeyi anlamanıza yardımcı olan AI destekli görsel asistanınız",
            .spanish: "Tu asistente visual con IA que te ayuda a entender todo lo que ves",
            .japanese: "見たものを理解するのに役立つAI搭載のビジュアルアシスタント",
            .portuguese: "Seu assistente visual com IA que ajuda você a entender tudo o que vê"
        ],
        "easy_to_use": [
            .english: "Easy to Use",
            .german: "Einfach zu bedienen",
            .turkish: "Kullanımı Kolay",
            .spanish: "Fácil de usar",
            .japanese: "使いやすい",
            .portuguese: "Fácil de usar"
        ],
        "photo_instruction": [
            .english: "Simply select or take a photo, and let AI explain what you're looking at",
            .german: "Wählen Sie einfach ein Foto aus oder machen Sie eines, und lassen Sie die KI erklären, was Sie sehen",
            .turkish: "Sadece bir fotoğraf seçin veya çekin ve yapay zekanın ne gördüğünüzü açıklamasına izin verin",
            .spanish: "Simplemente selecciona o toma una foto, y deja que la IA explique lo que estás viendo",
            .japanese: "写真を選択するか撮影するだけで、AIが見ているものを説明します",
            .portuguese: "Simplesmente selecione ou tire uma foto e deixe a IA explicar o que você está vendo"
        ],
        "privacy_title": [
            .english: "Private & Secure",
            .german: "Privat & Sicher",
            .turkish: "Gizli & Güvenli",
            .spanish: "Privado y Seguro",
            .japanese: "プイベート & セキュア",
            .portuguese: "Privado e Seguro"
        ],
        "privacy_description": [
            .english: "Your photos are processed securely and never stored",
            .german: "Ihre Fotos werden sicher verarbeitet und nie gespeichert",
            .turkish: "Fotoğraflarınız güvenli bir şekilde işlenir ve asla saklanmaz",
            .spanish: "Tus fotos se procesan de forma segura y nunca se almacenan",
            .japanese: "写真は安全に処理され、保存されることはありません",
            .portuguese: "Suas fotos são processadas com segurança e nunca são armazenadas"
        ],
        "get_started": [
            .english: "Get Started",
            .german: "Loslegen",
            .turkish: "Başlayın",
            .spanish: "Comenzar",
            .japanese: "始める",
            .portuguese: "Começar"
        ],
        "ask_me": [
            .english: "Ask Me!",
            .german: "Frag mich!",
            .turkish: "Bana Sor!",
            .spanish: "¡Pregúntame!",
            .japanese: "聞いてください！",
            .portuguese: "Pergunte-me!"
        ],
        "upload_instruction": [
            .english: "Upload your picture and ask what you are curious about",
            .german: "Laden Sie Ihr Bild hoch und fragen Sie, was Sie interessiert",
            .turkish: "Fotoğrafınızı yükleyin ve merak ettiğiniz şeyi sorun",
            .spanish: "Sube tu imagen y pregunta lo que te da curiosidad",
            .japanese: "画像をアップロードして、気になることを質問してください",
            .portuguese: "Carregue sua imagem e pergunte o que você está curioso"
        ],
        "what_is_this": [
            .english: "What is this?",
            .german: "Was ist das?",
            .turkish: "Bu nedir?",
            .spanish: "¿Qué es esto?",
            .japanese: "これは何ですか？",
            .portuguese: "O que é isto?"
        ],
        "processing_message": [
            .english: "We bring the best results for you",
            .german: "Wir liefern Ihnen die besten Ergebnisse",
            .turkish: "Size en iyi sonuçları getiriyoruz",
            .spanish: "Te traemos los mejores resultados",
            .japanese: "最高の結果をお届けします",
            .portuguese: "Trazemos os melhores resultados para você"
        ],
        "select_image": [
            .english: "Select Image",
            .german: "Bild auswählen",
            .turkish: "Resim Seç",
            .spanish: "Seleccionar imagen",
            .japanese: "画像を選択",
            .portuguese: "Selecionar imagem"
        ],
        "change_image": [
            .english: "Change image",
            .german: "Bild ändern",
            .turkish: "Resmi değiştir",
            .spanish: "Cambiar imagen",
            .japanese: "画像を変更",
            .portuguese: "Mudar imagem"
        ],
        "settings": [
            .english: "Settings",
            .german: "Einstellungen",
            .turkish: "Ayarlar",
            .spanish: "Configuración",
            .japanese: "設定",
            .portuguese: "Configurações"
        ],
        "language": [
            .english: "Language",
            .german: "Sprache",
            .turkish: "Dil",
            .spanish: "Idioma",
            .japanese: "言語",
            .portuguese: "Idioma"
        ],
        "change_language": [
            .english: "Change app language",
            .german: "App-Sprache ändern",
            .turkish: "Uygulama dilini değiştir",
            .spanish: "Cambiar idioma de la aplicación",
            .japanese: "アプリの言語を変更",
            .portuguese: "Mudar idioma do aplicativo"
        ],
        "rate_app": [
            .english: "Rate App",
            .german: "App bewerten",
            .turkish: "Uygulamayı Değerlendir",
            .spanish: "Calificar App",
            .japanese: "アプリを評価",
            .portuguese: "Avaliar App"
        ],
        "rate_app_subtitle": [
            .english: "Support us with 5 stars",
            .german: "Unterstützen Sie uns mit 5 Sternen",
            .turkish: "Bizi 5 yıldız ile destekleyin",
            .spanish: "Apóyanos con 5 estrellas",
            .japanese: "5つ星で応援する",
            .portuguese: "Apoie-nos com 5 estrelas"
        ],
        "follow_us": [
            .english: "Follow Us",
            .german: "Folgen Sie uns",
            .turkish: "Bizi Takip Edin",
            .spanish: "Síguenos",
            .japanese: "フォローする",
            .portuguese: "Siga-nos"
        ]
    ]

    @AppStorage("selectedLanguage") private var selectedLanguage: String = Language.english.rawValue

    func string(_ key: String) -> String {
        guard let currentLanguage = Language(rawValue: selectedLanguage),
              let translations = translations[key],
              let translation = translations[currentLanguage]
        else {
            return translations[key]?[.english] ?? key
        }
        return translation
    }
}
