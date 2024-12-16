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
    var state: Report.State = .notGitDirectory
    do {
      state = try await status().isEmpty ? .noChanges : .localChanges
    } catch {}

    let tag = try? await describeTag()

    return Report(state: state, tag: tag)
  }
}
