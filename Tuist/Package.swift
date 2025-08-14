// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Nemo",
    dependencies: [
        .package(
            url: "https://github.com/google-gemini/generative-ai-swift",
            .upToNextMajor(from: "0.5.6")
        ),
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk",
            .upToNextMajor(from: "11.0.0")
        ),
    ]
)
