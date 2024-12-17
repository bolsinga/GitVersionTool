//
//  Report.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation

private let Local = "local"

enum Report: CustomStringConvertible {
  init?(state: RepositoryState, name: String?) {
    let nonEmptyName = (name != nil && name!.isEmpty) ? nil : name?.firstLine
    switch state {
    case .invalid:
      self = .notGit
    case .localChanges:
      guard let nonEmptyName else { return nil }
      self = .localChanges(nonEmptyName)
    case .noChanges:
      guard let nonEmptyName else { return nil }
      self = .noChanges(nonEmptyName)
    }
  }

  case notGit
  case localChanges(String)
  case noChanges(String)

  var description: String {
    switch self {
    case .notGit:
      return "unknown"
    case .localChanges(let name):
      if name == Local {
        return name
      }
      return "\(name)-\(Local)"
    case .noChanges(let name):
      return name
    }
  }
}
