//
//  ReportTest.swift
//
//
//  Created by Greg Bolsinga on 12/15/24.
//

import Foundation
import Testing

@testable import GitVersion

struct ReportTest {
  @Test func state_noName() throws {
    #expect("\(Report(state: .invalid, name: nil))" == "unknown")
    #expect("\(Report(state: .localChanges, name: nil))" == "local")
    #expect("\(Report(state: .noChanges, name: nil))" == "version")
  }

  @Test func state_emptyName() throws {
    #expect("\(Report(state: .invalid, name: ""))" == "unknown")
    #expect("\(Report(state: .localChanges, name: ""))" == "local")
    #expect("\(Report(state: .noChanges, name: ""))" == "version")
  }

  @Test func state_name() throws {
    #expect("\(Report(state: .invalid, name: "name"))" == "unknown")
    #expect("\(Report(state: .localChanges, name: "name"))" == "name-local")
    #expect("\(Report(state: .noChanges, name: "name"))" == "name")
  }

  @Test func state_funkyName() throws {
    #expect("\(Report(state: .noChanges, name: "name\ntwo"))" == "name")
  }

  @Test func state_tag() throws {
    #expect("\(Report(state: .noChanges, tag: "name"))" == "name")
  }

  @Test func state_branch() throws {
    #expect("\(Report(state: .noChanges, tag: "tag", branch: "branch"))" == "tag")
    #expect("\(Report(state: .noChanges, tag: nil, branch: "branch"))" == "branch")
    #expect("\(Report(state: .noChanges, tag: "", branch: "branch"))" == "branch")
  }

  @Test func state_branchEmpty() throws {
    #expect("\(Report(state: .noChanges, tag: "tag", branch: ""))" == "tag")
    #expect("\(Report(state: .noChanges, tag: nil, branch: ""))" == "version")
    #expect("\(Report(state: .noChanges, tag: "", branch: ""))" == "version")
  }
}
