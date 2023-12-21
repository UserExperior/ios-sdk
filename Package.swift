// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "6.0.3"
let checksum = "7719ce4f896eaf93fd17a21a0d298c95a4f397707c3b82c6baad902e6422da62"
let repoName = "ios-sdk"

let package = Package(
    name: "UserExperior",
    
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UserExperior",
            targets: ["UserExperiorWrapper", "UserExperior"]
        ),
    ],
    
    dependencies: [
        .package(url: "https://github.com/UserExperior/UECrashReporter.git", .upToNextMajor(from: "1.0.6"))
    ],
    
    targets: [
        .target(
                name: "UserExperiorWrapper",
                path: "UserExperiorWrapper",
                exclude: ["README.md"]
        ),
        .binaryTarget(
            name: "UserExperior",
            url: "https://raw.githubusercontent.com/UserExperior/\(repoName)/\(version)/UserExperiorSDK.xcframework.zip",
            checksum: checksum
        )
    ]
)

