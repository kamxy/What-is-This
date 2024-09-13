//
//  imagePickerViewModel.swift
//  whatisthis
//
//  Created by Mehmet Kamay on 2.09.2024.
//

import Foundation
import SwiftUI
import PhotosUI


class ImagePickerViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
}
