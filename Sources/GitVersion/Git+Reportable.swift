//
//  Git+Reportable.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation
import GitLibrary

extension Git: Reportable {
  func state() async -> RepositoryState {
    do {
      return try await status().isEmpty ? .noChanges : .localChanges
    } catch {
      return .invalid
    }
  }

  func tag() async -> String? {
    try? await describeTag()
  }

  func branch() async -> String? {
    try? await branchName()
  }
}
