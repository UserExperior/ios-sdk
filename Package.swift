// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "6.0.14"
let checksum = "0f9a02cb6bd632fdef42f356f906212ebee7322af9c1116197893b2ed7809d03"
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

