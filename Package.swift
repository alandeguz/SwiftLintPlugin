// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "SwiftLintPlugin",
  platforms: [
    .iOS(.v13),
    .watchOS(.v6),
    .macOS(.v10_15),
    .tvOS(.v13)
  ],
  products: [
    .plugin(name: "SwiftLint", targets: ["SwiftLintPlugin"]),
  ],
  dependencies: [],
  targets: [
    .plugin(
      name: "SwiftLintPlugin",
      capability: .buildTool(),
      dependencies: ["SwiftLintBinary"]),
    .binaryTarget(
      name: "SwiftLintBinary",
      url: "https://github.com/realm/SwiftLint/releases/download/0.51.0/SwiftLintBinary-macos.artifactbundle.zip",
      checksum: "9fbfdf1c2a248469cfbe17a158c5fbf96ac1b606fbcfef4b800993e7accf43ae"
    )
  ]
)
