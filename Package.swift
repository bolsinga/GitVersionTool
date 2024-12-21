// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "GitVersion",
  platforms: [.macOS(.v15)],
  products: [
    .library(name: "GitVersion", targets: ["GitVersion"]),
    .executable(name: "Tool", targets: ["Tool"]),
    .plugin(name: "GitVersionCommand", targets: ["GitVersionCommand"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
    .package(url: "https://github.com/bolsinga/GitLibrary", from: "1.1.0"),
  ],
  targets: [
    .executableTarget(
      name: "Tool",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
        .product(name: "GitLibrary", package: "GitLibrary"),
        .byName(name: "GitVersion"),
      ]
    ),
    .target(name: "GitVersion"),
    .testTarget(name: "GitVersionTests", dependencies: ["GitVersion"]),
    .plugin(name: "GitVersionCommand", capability: .buildTool(), dependencies: ["Tool"])
  ]
)
