//
//  Reportable+Name.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/17/24.
//

extension Reportable {
  func name() async -> String? {
    guard let name = await tag(), !name.isEmpty else {
      guard let name = await branch(), !name.isEmpty else {
        return nil
      }
      return name
    }
    return name
  }
}
