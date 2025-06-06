// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "6.0.16"
let checksum = "865a4fad08de245c5ae4e85a45d504d638182b5d80c47d2c2db7badb274e0da7"
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

