// swift-tools-version: 5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIExt",
    platforms: [
        .iOS(.v16),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftUIExt",
            targets: ["SwiftUIExt"]),
    ],
    dependencies: [
        // Build for Local Preview Server
        // swift package --allow-writing-to-directory ./docs \
        // generate-documentation --target SwiftUIExt --output-path ./docs
        // swift package --disable-sandbox preview-documentation --target SwiftUIExt
        // Build for static-hosting
        // swift package --allow-writing-to-directory ./docs \
        // generate-documentation --target SwiftUIExt \
        // --output-path ./docs --transform-for-static-hosting \
        // --hosting-base-path SwiftUIExt --disable-indexing
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftUIExt",
            resources: [ Resource.process("Fonts") ]),
        .testTarget(
            name: "SwiftUIExtTests",
            dependencies: ["SwiftUIExt"])
    ]
)
