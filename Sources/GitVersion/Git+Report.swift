//
//  Git+Report.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation
import GitLibrary

extension Git {
  func report() async -> Report {
    do {
      try await status()
    } catch {
      return Report(localChanges: true)
    }

    guard let tag = try? await describeTag() else {
      return Report(localChanges: false)
    }
    return Report(localChanges: false, tag: tag)
  }
}
