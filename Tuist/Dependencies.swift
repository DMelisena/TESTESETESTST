
import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/google-gemini/deprecated-generative-ai-swift", requirement: .upToNextMajor(from: "0.5.6")),
        .remote(url: "https://github.com/onevcat/Kingfisher", requirement: .upToNextMajor(from: "7.12.0"))
    ],
    platforms: [.iOS]
)
