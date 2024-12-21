// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "GitVersion",
  platforms: [.macOS(.v15)],
  products: [
    .plugin(name: "GitVersionPlugin", targets: ["GitVersion"])
  ],
  targets: [
    .executableTarget(name: "Tool"),
    .plugin(name: "GitVersion", capability: .buildTool(), path: "Sources/GitVersion/"),
  ]
)
