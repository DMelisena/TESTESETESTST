// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: [:]
    )
#endif

let package = Package(
    name: "Nemo",
    dependencies: [
        .package(url: "https://github.com/google-gemini/deprecated-generative-ai-swift", .upToNextMajor(from: "0.5.6")),
        .package(url: "https://github.com/onevcat/Kingfisher", .upToNextMajor(from: "7.12.0"))
    ]
)

// let dependencies = Dependencies(
//     swiftPackageManager: SwiftPackageManagerDependencies(
//         [
//             .remote(
//                 url: "https://github.com/google-gemini/deprecated-generative-ai-swift",
//                 requirement: .exact("0.5.6")
//             ),
//         ]
//     ),
//     platforms: [.iOS, .macOS, .watchOS, .tvOS]
// )
