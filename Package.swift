// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "6.0.8"
let checksum = "056e454e215ffdc5ea84a33a9b9aba29e1d84565d63eda2e9e7812fa364153ec"
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

