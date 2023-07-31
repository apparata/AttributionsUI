// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "AttributionsUI",
    platforms: [
        .iOS(.v15), .macOS(.v13), .tvOS(.v15)
    ],
    products: [
        .library(name: "AttributionsUI", targets: ["AttributionsUI"])
    ],
    targets: [
        .target(
            name: "AttributionsUI",
            dependencies: [],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release)),
                .define("SWIFT_PACKAGE")
            ]),
    ]
)
