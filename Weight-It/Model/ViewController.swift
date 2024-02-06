import UIKit
import CoreML
import Vision

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var confidenceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func classifyImage(_ image: UIImage, completion: @escaping (String?) -> Void) {
        guard let model = try? VNCoreMLModel(for: SeeFood().model) else {
            print("Failed to load model")
            completion(nil) // Notify the completion handler of the failure
            return
        }

        let request = VNCoreMLRequest(model: model) { request, error in
            if let error = error {
                print("Failed to perform classification.\n\(error.localizedDescription)")
                completion(nil) // Notify the completion handler of the failure
                return
            }
            
            guard let results = request.results else {
                print("Unable to classify image.")
                completion(nil) // Notify the completion handler of the failure
                return
            }

            let classifications = results as! [VNClassificationObservation]

            if classifications.isEmpty {
                print("Nothing recognized.")
                completion("Nothing recognized.")
            } else {
                // Display the top classification
                let topClassification = classifications.first!
                let confidence = topClassification.confidence * 100
                let converted = String(format: "%.2f", confidence)
                let result = "\(topClassification.identifier) - \(converted)% confidence."
                completion(result) // Notify the completion handler of the result
            }
        }

        guard let ciImage = CIImage(image: image) else {
            fatalError("Couldn't convert UIImage to CIImage")
        }

        let handler = VNImageRequestHandler(ciImage: ciImage)
        do {
            try handler.perform([request])
        } catch {
            print("Failed to perform classification.\n\(error.localizedDescription)")
            completion(nil) // Notify the completion handler of the failure
        }
    }


    func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                print("Unable to classify image.\n\(error?.localizedDescription ?? "Error")")
                return
            }

            let classifications = results as! [VNClassificationObservation]

            if classifications.isEmpty {
                print("Nothing recognized.")
                self.classificationLabel.text = "Nothing recognized."
                self.confidenceLabel.text = ""
            } else {
                // Display the top classification
                let topClassification = classifications.first!
                let confidence = topClassification.confidence * 100
                let converted = String(format: "%.2f", confidence)
                self.classificationLabel.text = topClassification.identifier
                self.confidenceLabel.text = "\(converted)% confidence."
            }
        }
    }
}
