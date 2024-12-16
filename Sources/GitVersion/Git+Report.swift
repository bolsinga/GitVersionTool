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
    var state: GitDirectoryState = .notGitDirectory
    do {
      state = try await status().isEmpty ? .noChanges : .localChanges
    } catch {}

    let tag = try? await describeTag()

    var branch: String?
    if tag == nil {
      branch = try? await branchName()
    }

    return Report(state: state, tag: tag, branch: branch)
  }
}
