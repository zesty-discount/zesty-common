// swift-tools-version: 5.9
import PackageDescription

let vapor = Target.Dependency.product(name: "Vapor", package: "vapor")
let fluent = Target.Dependency.product(name: "Fluent", package: "fluent")
let entities = Target.Dependency.product(name: "Entities", package: "zesty-entities")

let package = Package(
    name: "zesty-common",
    platforms: [.macOS(.v10_15), .iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "Common", targets: ["Common"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.83.1"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),
        .package(url: "https://github.com/zesty-discount/zesty-entities", branch: "feature/ah/foodItems-hotfix"),
        .package(url: "https://github.com/vapor/jwt.git", from: "4.0.0"),

    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "Common", dependencies: [
            vapor, fluent, entities,
            .product(name: "JWT", package: "jwt"),
        ]),
        .testTarget(name: "CommonTests", dependencies: ["Common"]),
    ]
)
