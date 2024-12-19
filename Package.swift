// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Stocks",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Stocks",
            targets: ["Stocks"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vitali-kurlovich/TimeSeries", from: "0.3.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Stocks",
            dependencies: [
                "TimeSeries",
            ]
        ),
        .testTarget(
            name: "StocksTests",
            dependencies: ["Stocks", "TimeSeries"]
        ),
    ]
)
