import ProjectDescription

let project = Project(
    name: "Nemo",
    targets: [
        .target(
            name: "Nemo",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.Nemo",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Nemo/Sources/**"],
            resources: ["Nemo/Resources/**"],
            dependencies: [
                .external(name: "GoogleGenerativeAI"),
                .external(name: "Kingfisher")
            ],
        ),
        .target(
            name: "NemoTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.NemoTests",
            infoPlist: .default,
            sources: ["Nemo/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Nemo")]
        ),
    ]
)
