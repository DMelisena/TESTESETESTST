import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(
            url: "https://github.com/google-gemini/generative-ai-swift",
            requirement: .upToNextMajor(from: "0.5.6")
        ),
        .remote(
            url: "https://github.com/firebase/firebase-ios-sdk",
            requirement: .upToNextMajor(from: "11.0.0")
        ),
    ],
    platforms: [.iOS]
)
