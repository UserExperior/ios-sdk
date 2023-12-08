// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "6.0.2"
let checksum = "1cc0f70d820b684dd9aced8d3e710e1f2f40fb4932f8cc7315c1da1ee4a911e5"
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
        .package(url: "https://github.com/UserExperior/UECrashReporter.git", from: "1.0.3")
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

