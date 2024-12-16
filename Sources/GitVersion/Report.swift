//
//  Report.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation

struct Report: CustomStringConvertible {
  let localChanges: Bool
  let tag: String?

  init(localChanges: Bool, tag: String? = nil) {
    self.localChanges = localChanges
    self.tag = tag
  }

  var description: String {
    guard let tag else {
      return localChanges ? "local" : "version"
    }
    return localChanges ? "\(tag)-local" : tag
  }
}
