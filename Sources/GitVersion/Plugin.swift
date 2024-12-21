//
//  Plugin.swift
//  GitVersionPluginPackage
//
//  Created by Greg Bolsinga on 12/20/24.
//

import Foundation
import PackagePlugin

struct Fake: Reportable {
  func state() async -> RepositoryState {
    .noChanges
  }

  func tag() async -> String? {
    "2.0.2"
  }

  func branch() async -> String? {
    "main"
  }

  func commit() async -> String? {
    "xxxxxx"
  }
}

@main
struct Plugin: BuildToolPlugin {
  func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
    guard let target = target.sourceModule else { return [] }

    let outputFile = context.pluginWorkDirectoryURL.appending(path: "\(target.name)+Version.swift")

    let variable = "\(target.name)Version"

    let version = await Report.emit(reportable: Fake(), variable: variable)

    try "\(version)\n".write(to: outputFile, atomically: true, encoding: .utf8)

    return [
      .prebuildCommand(
        displayName: "Running GitVersion",
        executable: try context.tool(named: "/usr/bin/touch").url,
        arguments: [outputFile.path()],
        outputFilesDirectory: context.pluginWorkDirectoryURL)
    ]
  }
}
