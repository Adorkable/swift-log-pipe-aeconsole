// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-log-pipe-aeconsole",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(
            name: "LoggingPipeAEConsole",
            targets: ["LoggingPipeAEConsole"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Adorkable/swift-log-format-and-pipe.git", .upToNextMinor(from: "0.1.0")),
        .package(url: "https://github.com/tadija/AEConsole.git", .upToNextMinor(from: "0.6.0")),
    ],
    targets: [
        .target(
            name: "LoggingPipeAEConsole",
            dependencies: ["LoggingFormatAndPipe", "AEConsole"]),
        .testTarget(
            name: "LoggingPipeAEConsoleTests",
            dependencies: ["LoggingPipeAEConsole"]),
    ]
)
