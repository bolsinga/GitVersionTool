//
//  Reportable+Name.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/17/24.
//

import Foundation
import os

extension Logger {
  fileprivate static let name = Logger(
    subsystem: Bundle.main.bundleIdentifier ?? "unknown", category: "name")
}

extension Reportable {
  func name() async -> String? {
    guard let name = await tag(), !name.isEmpty else {
      guard let name = await branch(), !name.isEmpty else {
        guard let name = await commit(), !name.isEmpty else {
          return nil
        }
        Logger.name.info("commit: \(name, privacy: .public)")
        return name
      }
      Logger.name.info("branch: \(name, privacy: .public)")
      return name
    }
    Logger.name.info("tag: \(name, privacy: .public)")
    return name
  }
}
