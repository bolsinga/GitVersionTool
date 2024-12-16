//
//  Report.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation

struct Report: CustomStringConvertible {
  enum State: CustomStringConvertible {
    case notGitDirectory
    case localChanges
    case noChanges

    var description: String {
      switch self {
      case .notGitDirectory:
        "unknown"
      case .localChanges:
        "local"
      case .noChanges:
        "version"
      }
    }
  }

  let state: State
  let tag: String?

  init(state: State, tag: String? = nil) {
    self.state = state
    self.tag = tag
  }

  var description: String {
    guard let tag else {
      return state.description
    }
    switch state {
    case .notGitDirectory:
      return state.description
    case .localChanges:
      return "\(tag)-\(state)"
    case .noChanges:
      return tag
    }
  }
}
