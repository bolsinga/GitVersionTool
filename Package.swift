// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Example",
    platforms: [ .macOS(.v15) ],
    products: [ .library(name: "Example", targets: ["Example"]) ],
    targets: [ .target( name: "Example") ]
)
