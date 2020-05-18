// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CocoaCheckBox",
    platforms: [ .iOS(.v11)],
    products: [
        .library(
            name: "CocoaCheckBox",
            targets: ["CocoaCheckBox"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CocoaCheckBox",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "CocoaCheckBoxTests",
            dependencies: ["CocoaCheckBox"],
            path: "CocoaCheckBoxTests"),
    ]
)
