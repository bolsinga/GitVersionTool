//
//  Report.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation

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
      return nil
    case .localChanges:
      guard let name = await getName() else { return nil }
      self = .localChanges(name)
    case .noChanges:
      guard let name = await getName() else { return nil }
      self = .noChanges(name)
    }
  }

  case localChanges(String)
  case noChanges(String)

  var description: String {
    switch self {
    case .localChanges(let name):
      return "\(name)-local"
    case .noChanges(let name):
      return name
    }
  }
}
