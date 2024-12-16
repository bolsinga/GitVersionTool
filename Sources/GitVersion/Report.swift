//
//  Report.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation

enum Report: CustomStringConvertible {
  init(state: GitDirectoryState, name: String?) {
    let nonEmptyName = (name != nil && name!.isEmpty) ? nil : name
    switch state {
    case .notGitDirectory:
      self = .notGit
    case .localChanges:
      let name = (nonEmptyName != nil) ? "\(nonEmptyName!)-local" : "local"
      self = .localChanges(name)
    case .noChanges:
      let name = (nonEmptyName != nil) ? nonEmptyName! : "version"
      self = .noChanges(name)
    }
  }

  case notGit
  case localChanges(String)
  case noChanges(String)

  var description: String {
    switch self {
    case .notGit:
      return "unknown"
    case .localChanges(let name), .noChanges(let name):
      return name
    }
  }
}

extension Report {
  init(state: GitDirectoryState, tag: String? = nil, branch: String? = nil) {
    let nonEmptyTag = (tag != nil && tag!.isEmpty) ? nil : tag
    self.init(state: state, name: (nonEmptyTag != nil) ? nonEmptyTag : branch)
  }
}
