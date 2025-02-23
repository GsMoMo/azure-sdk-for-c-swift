// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AzureSDKForCSwift",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AzureSDKForCSwift",
            targets: ["AzureSDKForCSwift"]),
        .library(
            name: "CAzureSDKForCSwift",
            targets: ["CAzureSDKForCSwift"]),
        .library(
            name: "AzureIoTUniversalMiddleware",
            targets: ["AzureIoTUniversalMiddleware"]),
        .library(
            name: "AzureIoTMiddlewareForSwift",
            targets: ["AzureIoTMiddlewareForSwift"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/GsMoMo/swift-mqtt", branch: "master"),
        .package(url: "https://github.com/apple/swift-crypto.git", .upToNextMajor(from: "1.0.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CAzureSDKForCSwift",
            dependencies: ["AzureSDKForCSwift"]),
        .target(
            name: "AzureSDKForCSwift",
            dependencies: []),
        .target(
            name: "AzureIoTUniversalMiddleware",
            dependencies: ["AzureSDKForCSwift"]),
        .target(
            name: "AzureIoTMiddlewareForSwift",
            dependencies: [
                "AzureIoTUniversalMiddleware",
                "CAzureSDKForCSwift",
                .product(name: "MQTT", package: "swift-mqtt"),
                .product(name: "Crypto", package: "swift-crypto")
                ]),
        .executableTarget(
                    name: "demo",
                    dependencies: [
                        "AzureSDKForCSwift",
                        "CAzureSDKForCSwift",
                        .product(name: "MQTT", package: "swift-mqtt")
                        ]),
        .executableTarget(
                    name: "demo_pnp",
                    dependencies: [
                        "AzureSDKForCSwift",
                        "CAzureSDKForCSwift",
                        "AzureIoTUniversalMiddleware",
                        "AzureIoTMiddlewareForSwift",
                        ]),
        .testTarget(
            name: "AzureSDKForCSwiftTests",
            dependencies: ["AzureSDKForCSwift"]),
    ]
)
