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
    var localChanges = true
    do {
      localChanges = !(try await status().isEmpty)
    } catch {}

    let tag = try? await describeTag()

    return Report(localChanges: localChanges, tag: tag)
  }
}
