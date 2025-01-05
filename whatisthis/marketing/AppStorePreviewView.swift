import SwiftUI

enum DeviceType {
    case iPhone15Pro
    case iPhone15ProMax
    case iPhone14Pro
    case iPhone14ProMax
    
    var size: CGSize {
        switch self {
        case .iPhone15Pro:
            return CGSize(width: 393, height: 852)
        case .iPhone15ProMax:
            return CGSize(width: 430, height: 932)
        case .iPhone14Pro:
            return CGSize(width: 393, height: 852)
        case .iPhone14ProMax:
            return CGSize(width: 430, height: 932)
        }
    }
    
    var screenScale: CGFloat {
        return 3.0 // For @3x screenshots
    }
}

enum ScreenshotType {
    case onboarding
    case imageAnalysis
    case multiLanguage
    case settings
    
    var title: String {
        switch self {
        case .onboarding:
            return "Understand\nAnything"
        case .imageAnalysis:
            return "AI-Powered\nAssistant"
        case .multiLanguage:
            return "6 Languages\nSupported"
        case .settings:
            return "Easy to\nCustomize"
        }
    }
    
    var subtitle: String {
        switch self {
        case .onboarding:
            return "Get instant explanations"
        case .imageAnalysis:
            return "Accurate AI analysis"
        case .multiLanguage:
            return "Use in your language"
        case .settings:
            return "Personalize your experience"
        }
    }
}

struct AppStorePreviewView: View {
    let deviceType: DeviceType
    let screenshotType: ScreenshotType
    let backgroundColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Marketing Text
                    VStack(spacing: 4) {
                        Text(screenshotType.title)
                            .font(.system(size: 40, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                        Text(screenshotType.subtitle)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding(.top, 60)
                    
                    // App Screenshot
                    Group {
                        switch screenshotType {
                        case .onboarding:
                            MockOnboardingView()
                        case .imageAnalysis:
                            MockAnalysisView()
                        case .multiLanguage:
                            languagePreview
                        case .settings:
                            MockSettingsView()
                        }
                    }
                    .frame(maxWidth: geometry.size.width * 0.9)
                    .frame(height: geometry.size.height * 0.7)
                    .background(Color(uiColor: .systemBackground))
                    .cornerRadius(25)
                    .shadow(radius: 10)
                    
                    Spacer()
                }
                .padding()
            }
        }
        .frame(width: deviceType.size.width, height: deviceType.size.height)
    }
    
    var languagePreview: some View {
        VStack(spacing: 15) {
            ForEach(Language.allCases, id: \.self) { language in
                HStack {
                    Text(languageName(for: language))
                        .font(.title3)
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(10)
            }
        }
        .padding()
    }
    
    private func languageName(for language: Language) -> String {
        switch language {
        case .english: return "English 🇺🇸"
        case .german: return "Deutsch 🇩🇪"
        case .turkish: return "Türkçe 🇹🇷"
        case .spanish: return "Español 🇪🇸"
        case .japanese: return "日本語 🇯🇵"
        case .portuguese: return "Português 🇧🇷"
        }
    }
}

// Mock Views for Screenshots
struct MockOnboardingView: View {
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "camera.viewfinder")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .foregroundColor(.blue)
            
            Text("Welcome to What Is This")
                .font(.title.bold())
            
            Text("Your AI-powered visual assistant that helps you understand anything you see")
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
    }
}

struct MockAnalysisView: View {
    var body: some View {
        VStack {
            Image("demo_image", bundle: nil)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(15)
            
            Text("This appears to be a modern smartphone...")
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(10)
        }
        .padding()
    }
}

struct MockSettingsView: View {
    var body: some View {
        List {
            HStack {
                Text("🌎")
                Text("Language")
                Spacer()
                Text("English")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("🤩")
                Text("Rate App")
            }
            
            HStack {
                Text("𝕏")
                Text("Follow Us")
            }
        }
    }
}

// Preview helper
struct AppStoreScreenshotGenerator: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach([
                    (ScreenshotType.onboarding, Color.blue),
                    (ScreenshotType.imageAnalysis, Color.purple),
                    (ScreenshotType.multiLanguage, Color.orange),
                    (ScreenshotType.settings, Color.green)
                ], id: \.0) { screenshot, color in
                    AppStorePreviewView(
                        deviceType: .iPhone15Pro,
                        screenshotType: screenshot,
                        backgroundColor: color
                    )
                    .frame(height: 852) // iPhone 15 Pro height
                }
            }
            .padding()
        }
    }
}

#Preview {
    AppStoreScreenshotGenerator()
} 