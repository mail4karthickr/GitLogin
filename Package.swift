// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GitHubClone",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Models", targets: ["Models"]),
        .library(name: "Environment", targets: ["Environment"]),
        .library(name: "GitClient", targets: ["GitClient"]),
        .library(name: "GitClientLive", targets: ["GitClientLive"]),
        .library(name: "WebView", targets: ["WebView"]),
        .library(name: "SignIn", targets: ["SignIn"]),
        .library(name: "Helpers", targets: ["Helpers"]),
        .library(name: "MockService", targets: ["MockService"]),
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "HomeFeature", targets: ["HomeFeature"]),
        .library(name: "NotificationsFeature", targets: ["NotificationsFeature"]),
        .library(name: "ExploreFeature", targets: ["ExploreFeature"]),
        .library(name: "ProfileFeature", targets: ["ProfileFeature"]),
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
                "GitClient", "GitClientLive"
            ]
        ),
        .target(name: "GitClient", dependencies: ["Models"]),
        .target(name: "GitClientLive", dependencies: ["Models", "GitClient"]),
        .target(name: "WebView"),
        .target(
            name: "SignIn",
            dependencies: [
                "Models",
                "WebView",
                "GitClient",
                "Environment",
                "Helpers",
                "AppFeature",
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
            name: "Helpers",
            dependencies: [
                .product(name: "SwiftUINavigation", package: "swiftui-navigation")
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "MockService",
            dependencies: [
                "GitClient",
                "Helpers",
                "Models"
            ]
        ),
        .target(
            name: "AppFeature",
            dependencies: [
                "HomeFeature",
                "NotificationsFeature",
                "ExploreFeature",
                "ProfileFeature",
                .product(name: "SwiftUINavigation", package: "swiftui-navigation")
            ]
        ),
        .target(
            name: "HomeFeature",
            dependencies: [
                "Environment",
                .product(name: "SwiftUINavigation", package: "swiftui-navigation")
            ]
        ),
        .target(
            name: "NotificationsFeature",
            dependencies: [
                .product(name: "SwiftUINavigation", package: "swiftui-navigation")
            ]
        ),
        .target(
            name: "ExploreFeature",
            dependencies: [
                .product(name: "SwiftUINavigation", package: "swiftui-navigation")
            ]
        ),
        .target(
            name: "ProfileFeature",
            dependencies: [
                .product(name: "SwiftUINavigation", package: "swiftui-navigation")
            ]
        ),
    ]
)
