//
//  GitVersionTool.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import ArgumentParser
import Foundation
import GitLibrary
import GitVersion

@main
public struct GitVersionTool: AsyncParsableCommand {
  public static let configuration = CommandConfiguration(
    commandName: "GitVersion",
    abstract: "A tool for returning a version string for Swift Package Manager Plugins.",
    version: "1.0.0"
  )

  /// Git Directory to examine for version.
  @Option(
    help: "The path at which return a git version.",
    transform: ({
      let url = URL(filePath: $0, directoryHint: .isDirectory)
      let manager = FileManager.default
      if !manager.fileExists(atPath: url.relativePath) {
        try manager.createDirectory(at: url, withIntermediateDirectories: true)
      }

      return url
    })
  )
  var gitDirectory: URL

  /// File to write version to.
  @Option(
    help: "The file to write to.",
    transform: ({
      let url = URL(filePath: $0)
      let manager = FileManager.default
      let directory = url.deletingLastPathComponent()
      if !manager.fileExists(atPath: directory.path()) {
        try manager.createDirectory(at: directory, withIntermediateDirectories: true)
      }

      return url
    })
  )
  var output: URL?

  /// Optional variableName to use for swift code.
  @Option(help: "The variable name to use to generate Swift source code.")
  var variable: String?

  public func run() async throws {
    #if DEBUG
      let suppressStandardErr = false
    #else
      let suppressStandarErr = true
    #endif
    let git = Git(directory: gitDirectory, suppressStandardErr: suppressStandardErr)

    let version = await Report.emit(reportable: git, variable: variable)

    if let output {
      try "\(version)\n".write(to: output, atomically: true, encoding: .utf8)
    } else {
      print(version)
    }
  }

  public init() {}  // This is public and empty to help the compiler.
}
