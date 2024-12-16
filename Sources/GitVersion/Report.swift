//
//  Report.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation

struct Report: CustomStringConvertible {
  let localChanges: Bool

  var description: String {
    if localChanges { return "local" }
    return "version"
  }
}
