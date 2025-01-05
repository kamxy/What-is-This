//
//  homeView.swift
//  whatisthis
//
//  Created by Mehmet Kamay on 2.09.2024.
//

import SwiftUI
import PhotosUI
import AVKit


struct homeView: View {
    @ObservedObject var homeViewModel = PhotoReasoningViewModel()
    @StateObject private var viewModel = ImagePickerViewModel()
    @State private var isPickerPresented = false
    @State var welcome: String = "ask_me"
    private let localizedStrings = LocalizedStrings.shared
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if viewModel.selectedImage == nil {
                    VStack(spacing: 30) {
                        Image("question_mark")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                            .shadow(radius: 5)
                        
                        Text(localizedStrings.string("upload_instruction"))
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding()
                            .foregroundColor(.secondary)
                        
                        Text(localizedStrings.string("what_is_this"))
                            .font(.largeTitle)
                            .foregroundColor(Color("textColor"))
                            .bold()
                    }
                    .padding()
                } else {
                    Image(uiImage: viewModel.selectedImage!)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .padding()
                }
                
                if homeViewModel.inProgress {
                    VStack(spacing: 15) {
                        Text(localizedStrings.string("processing_message"))
                            .font(.title2)
                            .multilineTextAlignment(.center)
                        
                        ProgressView()
                            .controlSize(.large)
                            .tint(Color("AccentColor"))
                    }
                    .padding()
                } else {
                    ScrollView {
                        Text(homeViewModel.outputText)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .background(Color("backgroundGray").opacity(0.1))
                    .cornerRadius(15)
                    .padding()
                }
                
                Spacer()
                
                Button(action: { isPickerPresented = true }) {
                    HStack {
                        Image(systemName: "photo")
                        Text(localizedStrings.string(!homeViewModel.outputText.isEmpty ? "change_image" : "select_image"))
                    }
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("AccentColor"))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                }
                .padding()
                .sheet(isPresented: $isPickerPresented) {
                    PhotoPicker(selectedImage: $viewModel.selectedImage)
                        .onDisappear {
                            if viewModel.selectedImage != nil {
                                homeViewModel.selectedItems = viewModel.selectedImage ?? UIImage()
                                welcome = ""
                                Task {
                                    await homeViewModel.reason()
                                }
                            }
                        }
                }
            }
            .navigationTitle(localizedStrings.string(welcome))
            .toolbar {
                if homeViewModel.outputText.isEmpty {
                    ToolbarItem {
                        NavigationLink(destination: settingsView()) {
                            Image(systemName: "gear")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    homeView()
}

