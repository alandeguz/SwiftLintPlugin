//
//  SwiftLintBuildToolPlugin.swift
//  Plugins/SwiftLint
//
//  Created by Alan DeGuzman on 9/23/22.
//
//  This local plugin can eventually be replaced by an official remote plugin.
//  https://github.com/realm/SwiftLint/issues/3840#issuecomment-1085699163
//  https://github.com/realm/SwiftLint/pull/4176
//

import PackagePlugin

@main

// for operating on a Swift package
struct SwiftLintBuildToolPlugin: BuildToolPlugin {

  enum Const {
    static let tool = "swiftlint"
    static let config = ".swiftlint.yml"
  }

  func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
    [
      try .swiftlint(
        exec: try context.tool(named: Const.tool).path,
        config: context.pluginWorkDirectory.appending(subpath: Const.config),
        lintDirectory: context.package.directory,
        outputFilesDirectory: context.pluginWorkDirectory)
    ]
  }

}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

// for operating on a Xcode project
extension SwiftLintBuildToolPlugin: XcodeBuildToolPlugin {

  func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
    [
      try .swiftlint(
        exec: try context.tool(named: Const.tool).path,
        config: context.xcodeProject.directory.appending(subpath: Const.config),
        lintDirectory: context.xcodeProject.directory,
        outputFilesDirectory: context.pluginWorkDirectory)
    ]
  }

}

private extension Command {

  static func swiftlint(exec: Path,
                        config: Path,
                        lintDirectory: Path,
                        outputFilesDirectory: Path) throws -> Command {
    .prebuildCommand(
      displayName: "Running SwiftLint",
      executable: exec,
      arguments: [
        "lint", lintDirectory.string,
        "--config", config.string
      ],
      environment: [:],
      outputFilesDirectory: outputFilesDirectory
    )
  }

}
#endif
