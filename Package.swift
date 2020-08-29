// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "VaporExample",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        .package(url: "https://github.com/mongodb/mongo-swift-driver.git", from: "0.1.3")
    ],
    targets: [
        .target(name: "VaporExample", dependencies: [
            .product(name: "MongoSwift", package: "mongo-swift-driver"),
            .product(name: "Vapor", package: "vapor"),
        ])
    ]
)
