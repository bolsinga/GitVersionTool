// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "GitVersion",
  platforms: [.macOS(.v15)],
  products: [.executable(name: "GitVersion", targets: ["GitVersion"])],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
    .package(url: "https://github.com/bolsinga/GitLibrary", branch: "main"),
  ],
  targets: [
    .executableTarget(
      name: "GitVersion",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
        .product(name: "GitLibrary", package: "GitLibrary"),
      ]
    ),
    .testTarget(name: "GitVersionTests", dependencies: ["GitVersion"]),
  ]
)
