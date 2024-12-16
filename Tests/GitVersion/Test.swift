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
  @Test func state_noName() throws {
    #expect("\(Report(state: .notGitDirectory, name: nil))" == "unknown")
    #expect("\(Report(state: .localChanges, name: nil))" == "local")
    #expect("\(Report(state: .noChanges, name: nil))" == "version")
  }

  @Test func state_name() throws {
    #expect("\(Report(state: .notGitDirectory, name: "name"))" == "unknown")
    #expect("\(Report(state: .localChanges, name: "name"))" == "name-local")
    #expect("\(Report(state: .noChanges, name: "name"))" == "name")
  }

  @Test func state_tag() throws {
    #expect("\(Report(state: .noChanges, tag: "name"))" == "name")
  }
}
