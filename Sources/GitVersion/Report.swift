//
//  Report.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation

enum GitDirectoryState {
  case notGitDirectory
  case localChanges
  case noChanges
}

enum Report: CustomStringConvertible {
  init(state: GitDirectoryState, name: String?) {
    switch state {
    case .notGitDirectory:
      self = .notGit
    case .localChanges:
      self = .localChanges(name)
    case .noChanges:
      self = .noChanges(name)
    }
  }

  case notGit
  case localChanges(String?)
  case noChanges(String?)

  var description: String {
    switch self {
    case .notGit:
      return "unknown"
    case .localChanges(let name):
      guard let name else { return "local" }
      return "\(name)-local"
    case .noChanges(let name):
      guard let name else { return "version" }
      return name
    }
  }
}

extension Report {
  init(state: GitDirectoryState, tag: String? = nil) {
    self.init(state: state, name: tag)
  }
}
