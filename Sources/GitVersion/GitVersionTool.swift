//
//  GitVersionTool.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import ArgumentParser
import Foundation
import GitLibrary

@main
public struct GitVersionTool: AsyncParsableCommand {
  public static let configuration = CommandConfiguration(
    commandName: "GitVersion",
    abstract: "A tool for returning a version string for Swift Package Manager Plugins.",
    version: "1.0.0"
  )

  /// Git Directory for output file.
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

  public func run() async throws {
    let git = Git(directory: gitDirectory)
    print(await git.report())
  }

  public init() {}  // This is public and empty to help the compiler.
}
