//
//  Plugin.swift
//  GitVersionPluginPackage
//
//  Created by Greg Bolsinga on 12/20/24.
//

import Foundation
import PackagePlugin

@main
struct Plugin: BuildToolPlugin {
  func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
    guard let target = target.sourceModule else { return [] }

    let outputFile = context.pluginWorkDirectoryURL.appending(path: "\(target.name)+Version.swift")

    let variableName = "\(target.name)Version"

    return [
      .prebuildCommand(
        displayName: "Running GitVersion",
        executable: try context.tool(named: "Tool").url,
        arguments: [
          "--git-directory", target.directory.string,
          "--output", outputFile.absoluteString,
          "--variable", variableName,
        ],
        outputFilesDirectory: context.pluginWorkDirectoryURL)
    ]
  }
}
