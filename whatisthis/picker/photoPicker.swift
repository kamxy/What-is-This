import SwiftUI
import PhotosUI

class ImagePickerViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
}


struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoPicker

        init(parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }

            provider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    self.parent.selectedImage = image as? UIImage
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
}
