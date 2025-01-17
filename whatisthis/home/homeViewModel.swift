// Copyright 2023 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import GoogleGenerativeAI
import OSLog
import PhotosUI
import SwiftUI

@MainActor
class PhotoReasoningViewModel: ObservableObject {
    // Maximum value for the larger of the two image dimensions (height and width) in pixels. This is
    // being used to reduce the image size in bytes.
    private static let largestImageDimension = 768.0

    private var logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "generative-ai")

    @Published
    var userInput: String = ""

    @Published
    var selectedItems = UIImage()

    @Published
    var outputText: String = ""

    @Published
    var errorMessage: String?

    @Published
    var inProgress = false

    private var model: GenerativeModel?

    init() {
        model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: APIKey.default)
    }

    func reason() async {
        defer {
            inProgress = false
        }
        guard let model else {
            return
        }

        do {
            inProgress = true
            errorMessage = nil
            outputText = ""

            let prompt = "Can you give detailed information about this picture?"

            var images = [any ThrowingPartsRepresentable]()

            if selectedItems.size.fits(largestDimension: PhotoReasoningViewModel.largestImageDimension) {
                images.append(selectedItems)
            } else {
                let resizedImage = selectedItems
                    .preparingThumbnail(of: selectedItems.size
                        .aspectFit(largestDimension: PhotoReasoningViewModel.largestImageDimension))

                images.append(resizedImage!)
            }

            let outputContentStream = model.generateContentStream(prompt, images)
            var temp = ""
            // stream response
            for try await outputContent in outputContentStream {
                guard let line = outputContent.text else {
                    return
                }

                temp = temp + line
            }
            outputText = temp

        } catch {
            logger.error("\(error.localizedDescription)")
            errorMessage = error.localizedDescription
        }
    }
}

private extension CGSize {
    func fits(largestDimension length: CGFloat) -> Bool {
        return width <= length && height <= length
    }

    func aspectFit(largestDimension length: CGFloat) -> CGSize {
        let aspectRatio = width / height
        if width > height {
            let width = min(self.width, length)
            return CGSize(width: width, height: round(width / aspectRatio))
        } else {
            let height = min(self.height, length)
            return CGSize(width: round(height * aspectRatio), height: height)
        }
    }
}
