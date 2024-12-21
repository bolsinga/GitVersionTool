//
//  Git+Reportable.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation
import GitLibrary
import GitVersion

extension Git: Reportable {
  public func state() async -> RepositoryState {
    do {
      return try await status().isEmpty ? .noChanges : .localChanges
    } catch {
      return .invalid
    }
  }

  public func tag() async -> String? {
    try? await describeTag()
  }

  public func branch() async -> String? {
    try? await branchName()
  }

  public func commit() async -> String? {
    try? await mostRecentHash()
  }
}
