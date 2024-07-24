// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ComponentsKit",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ComponentsKit",
            targets: ["ComponentsKit"]
        ),
    ],
    dependencies: [
        .package(path: "../AssetKit"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ComponentsKit",
            dependencies: ["AssetKit"],
            path: "Sources"
        ),
        .testTarget(
            name: "ComponentsKitTests",
            dependencies: ["ComponentsKit"]
        ),
    ]
)
