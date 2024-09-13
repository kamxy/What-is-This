//
//  splashView.swift
//  whatisthis
//
//  Created by Mehmet Kamay on 6.09.2024.
//

import SwiftUI

struct splashView: View {
    var body: some View {
        ZStack{
            Color(.accent).ignoresSafeArea()
            Image("splash").frame(width: 10,height: 10).scaleEffect(0.45)
            
        }
    }
}

#Preview {
    splashView()
}
