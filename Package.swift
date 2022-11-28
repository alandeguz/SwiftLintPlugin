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
      url: "https://github.com/realm/SwiftLint/releases/download/0.50.1/SwiftLintBinary-macos.artifactbundle.zip",
      checksum: "487c57b5a39b80d64a20a2d052312c3f5ff1a4ea28e3cf5556e43c5b9a184c0c"
    )
  ]
)
