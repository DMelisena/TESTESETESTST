import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(
            url: "https://github.com/google-gemini/generative-ai-swift",
            requirement: .upToNextMajor(from: "0.5.6")
        ),
    ],
    platforms: [.iOS]
)
