//
//  Report.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation

private let Local = "local"

enum Report: CustomStringConvertible {
  init?(state: RepositoryState, name: String?) async {
    await self.init(state: state, namer: { name })
  }

  init?(state: RepositoryState, namer: @escaping () async -> String?) async {
    let getName = {
      let name = await namer()
      return (name != nil && name!.isEmpty) ? nil : name?.firstLine
    }
    switch state {
    case .invalid:
      self = .notGit
    case .localChanges:
      guard let name = await getName() else { return nil }
      self = .localChanges(name)
    case .noChanges:
      guard let name = await getName() else { return nil }
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
