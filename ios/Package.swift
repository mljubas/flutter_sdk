// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "adjust_sdk",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(name: "adjust-sdk", targets: ["adjust_sdk"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/adjust/ios_sdk",
            .upToNextMajor(from: "5.5.2")
        ),
    ],
    targets: [
        .target(
            name: "adjust_sdk",
            dependencies: [
                .product(name: "Adjust", package: "ios_sdk"),
            ],
            path: "Classes"
        ),
    ]
)
