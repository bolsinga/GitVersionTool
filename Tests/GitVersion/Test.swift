//
//  Test.swift
//
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation
import Testing

@testable import GitVersion

struct Test {
  @Test func localChanges() throws {
    #expect("\(Report(localChanges: true))" == "local")
    #expect("\(Report(localChanges: false))" == "version")
  }
}
