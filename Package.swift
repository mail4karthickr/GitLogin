// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GitHubClone",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Models",
            targets: ["Models"]
        ),
        .library(
            name: "Views",
            targets: ["Views"]
        ),
        .library(
            name: "Environment",
            targets: ["Environment"]
        ),
        .library(
            name: "Service",
            targets: ["Service"]
        ),
        .library(
            name: "WebView",
            targets: ["WebView"]
        ),
        .library(
            name: "SignIn",
            targets: ["SignIn"]
        ),
        .library(
            name: "Helpers",
            targets: ["Helpers"]
        ),
        .library(
            name: "MockService",
            targets: ["MockService"]
        )
    ],
    dependencies: [
      .package(url: "https://github.com/pointfreeco/swiftui-navigation", from: "0.1.0"),
      .package(url: "https://github.com/pointfreeco/swift-case-paths.git", from: "0.4.0"),
      .package(url: "https://github.com/groue/CombineExpectations.git", from: "0.10.0")
    ],
    targets: [
        .target(name: "Models"),
        .target(
            name: "Environment",
            dependencies: [
                "Service"
            ]
        ),
        .target(name: "Service", dependencies: ["Models"]),
        .target(name: "WebView"),
        .target(
            name: "SignIn",
            dependencies: [
                "Models",
                "WebView",
                "Service",
                "Environment",
                "Views",
                .product(name: "SwiftUINavigation", package: "swiftui-navigation")
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "SignInTests",
            dependencies: [
                "SignIn",
                "Environment",
                "MockService",
                .product(name: "CasePaths", package: "swift-case-paths"),
                .product(name: "CombineExpectations", package: "CombineExpectations")
            ]
        ),
        .target(
            name: "Views",
            dependencies: [
                .product(name: "SwiftUINavigation", package: "swiftui-navigation")
            ]
        ),
        .target(name: "Helpers"),
        .target(
            name: "MockService",
            dependencies: [
                "Service",
                "Helpers",
                "Models"
            ]
        ),
        .target(
            name: "AppFeature",
            dependencies: [
                .product(name: "SwiftUINavigation", package: "swiftui-navigation")
            ]
        ),
    ]
)
