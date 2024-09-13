import AVFoundation

class CameraManager: ObservableObject {
    private var session: AVCaptureSession
    private var videoOutput: AVCaptureVideoDataOutput

    @Published var previewLayer: AVCaptureVideoPreviewLayer?

    init() {
        session = AVCaptureSession()
        videoOutput = AVCaptureVideoDataOutput()

        setupCamera()
    }

    private func setupCamera() {
        session.beginConfiguration()
        
        // Set up the camera input
        guard let camera = AVCaptureDevice.default(for: .video) else {
            print("No camera available")
            return
        }

        do {
            let input = try AVCaptureDeviceInput(device: camera)
            if session.canAddInput(input) {
                session.addInput(input)
            }
        } catch {
            print("Failed to create camera input: \(error)")
            return
        }

        // Set up the video output
        if session.canAddOutput(videoOutput) {
            session.addOutput(videoOutput)
        }

        session.commitConfiguration()

        // Create preview layer
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
    }

    func startRunning() {
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
        }
    }

    func stopRunning() {
        DispatchQueue.global(qos: .background).async {
            self.session.stopRunning()
        }
    }

    func getPreviewLayer() -> AVCaptureVideoPreviewLayer? {
        return previewLayer
    }
    
    func getSession() -> AVCaptureSession {
        return session
    }
}
