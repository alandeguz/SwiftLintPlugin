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
      url: "https://github.com/realm/SwiftLint/releases/download/0.54.0/SwiftLintBinary-macos.artifactbundle.zip",
      checksum: "963121d6babf2bf5fd66a21ac9297e86d855cbc9d28322790646b88dceca00f1"
    )
  ]
)
