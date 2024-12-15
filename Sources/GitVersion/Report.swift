//
//  Report.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation

public struct Report: CustomStringConvertible {
  let localChanges: Bool

  public var description: String {
    if localChanges { return "local" }
    return "version"
  }
}
