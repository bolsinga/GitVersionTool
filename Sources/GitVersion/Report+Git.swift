//
//  Report+Git.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation
import GitLibrary

extension Report {
  static func create(state: RepositoryState, tag: String? = nil, branch: String? = nil) -> Report {
    let nonEmptyTag = (tag != nil && tag!.isEmpty) ? nil : tag
    return Report(state: state, name: (nonEmptyTag != nil) ? nonEmptyTag : branch)
  }
}

extension Report {
  static func create(from git: Git) async -> Report {
    var state: RepositoryState = .invalid
    do {
      state = try await git.status().isEmpty ? .noChanges : .localChanges
    } catch {}

    let tag = try? await git.describeTag()

    var branch: String?
    if tag == nil {
      branch = try? await git.branchName()
    }

    return Report.create(state: state, tag: tag, branch: branch)
  }
}
