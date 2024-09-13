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
    @ObservedObject var homeViewModel  = PhotoReasoningViewModel()
    @State var selectedImage: UIImage? = nil
    @StateObject private var viewModel = ImagePickerViewModel()
    @State private var isPickerPresented = false
    @State var welcome:String = "Ask Me!"
    

    var body: some View {
        NavigationStack {
           
            VStack{
               
                if(viewModel.selectedImage == nil){
                    Spacer()
                }
                
              
              
                if let image = viewModel.selectedImage {
                               Image(uiImage: image)
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 300, height: 300)
                                   .cornerRadius(10)
                                   .shadow(radius: 10)
                           } else {
                               Image("question_mark").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100).padding(.all)
                               Text("Upload your picture and ask what you are curious about").font(.title).multilineTextAlignment(.center).padding()
                               Text("What is this?").font(.largeTitle).foregroundColor(Color("textColor")).bold()
                           }
                if(homeViewModel.inProgress){
                    Text("We bring the best results for you").font(.title).multilineTextAlignment(.center).padding()
                    ProgressView().controlSize(.large)
                }else{
                    ScrollView{
                        Text(homeViewModel.outputText).padding()
                    }

                }
                    Spacer()
                           Button(action: {
                               isPickerPresented = true
                           }) {
                               Text(!homeViewModel.outputText.isEmpty ? "Change image": "Select Image")
                                   .font(.title2)
                                   .padding()
                                   .background(Color("AccentColor"))
                                   .foregroundColor(.white)
                                   .cornerRadius(10)
                           }
                           .sheet(isPresented: $isPickerPresented) {
                               PhotoPicker(selectedImage: $viewModel.selectedImage).onDisappear(){
                                   if(viewModel.selectedImage != nil){
                                       homeViewModel.selectedItems = viewModel.selectedImage ?? UIImage()
                                       welcome = "";           Task{
                                           await homeViewModel.reason()
                                       }
                                       
                                   }
                               }
                           }
                           .padding()
                
            }.navigationTitle(welcome).frame(maxWidth: .infinity, maxHeight: .infinity).toolbar(content: {
                if homeViewModel.outputText.isEmpty {
                    ToolbarItem(){
                        
                        NavigationLink(destination:  settingsView()) {
                          
                                Image(systemName: "gear" )
                         
                                       }
                    }
                }
              
                
               

            })
        }
    }
}

#Preview {
    homeView()
}

