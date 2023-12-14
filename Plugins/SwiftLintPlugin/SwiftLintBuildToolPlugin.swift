//
//  SwiftLintBuildToolPlugin.swift
//
//  Created by Alan DeGuzman on 9/23/22.
//

import PackagePlugin
import Foundation

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
      
      var args = [
        "lint", lintDirectory.string,
        "--config", config.string
      ]
      
      if ProcessInfo.processInfo.environment["CI_XCODE_CLOUD"] == "TRUE" {
          args.append("--no-cache")
      } else {
          args.append("--cache-path")
          args.append("\(outputFilesDirectory)")
      }
      
      return
          .prebuildCommand(
            displayName: "Running SwiftLint",
            executable: exec,
            arguments: args,
            environment: [:],
            outputFilesDirectory: outputFilesDirectory
          )
  }

}
#endif
