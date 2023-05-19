// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIExt",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftUIExt",
            targets: ["SwiftUIExt"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftUIExt",
            resources: [
                Resource.process("Fonts"),
//                Resource.process("Sources/SwiftUIExt/Assets/Background/SSOBackground"),
    //                Resource.process("Assets/head turn animation.mp4")
    //                Resource.process("Assets/Sounds/Glass.aiff")
            ]),
        .testTarget(
            name: "SwiftUIExtTests",
            dependencies: ["SwiftUIExt"])
    ]
)
