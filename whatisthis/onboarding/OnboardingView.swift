import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var currentPage = 0
    
    let pages = [
        OnboardingPage(
            image: "camera.viewfinder",
            title: "Welcome to What Is This",
            description: "Your AI-powered visual assistant that helps you understand anything you see"
        ),
        OnboardingPage(
            image: "photo.on.rectangle",
            title: "Easy to Use",
            description: "Simply select or take a photo, and let AI explain what you're looking at"
        ),
        OnboardingPage(
            image: "lock.shield",
            title: "Private & Secure",
            description: "Your photos are processed securely and never stored"
        )
    ]
    
    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(0..<pages.count, id: \.self) { index in
                VStack(spacing: 20) {
                    Image(systemName: pages[index].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color("AccentColor"))
                    
                    Text(pages[index].title)
                        .font(.title)
                        .bold()
                    
                    Text(pages[index].description)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    if index == pages.count - 1 {
                        Button("Get Started") {
                            hasSeenOnboarding = true
                        }
                        .font(.title2)
                        .padding()
                        .background(Color("AccentColor"))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingPage {
    let image: String
    let title: String
    let description: String
} 