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
  @Test func state_noTag() throws {
    #expect("\(Report(state: .notGitDirectory))" == "unknown")
    #expect("\(Report(state: .localChanges))" == "local")
    #expect("\(Report(state: .noChanges))" == "version")
  }

  @Test func state_tag() throws {
    #expect("\(Report(state: .notGitDirectory, tag: "tag"))" == "unknown")
    #expect("\(Report(state: .localChanges, tag: "tag"))" == "tag-local")
    #expect("\(Report(state: .noChanges, tag: "tag"))" == "tag")
  }
}
