// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "copycat",
    platforms: [.macOS(.v10_15)],
    targets: [
        .executableTarget(
            name: "copycat",
            dependencies: []
        )
    ]
)
