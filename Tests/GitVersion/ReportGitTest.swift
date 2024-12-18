//
//  ReportGitTest.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/17/24.
//

import Foundation
import Testing

@testable import GitVersion

struct TestReportable: Reportable {
  let state: RepositoryState
  let tag: String?
  let branch: String?

  internal init(state: RepositoryState, tag: String? = nil, branch: String? = nil) {
    self.state = state
    self.tag = tag
    self.branch = branch
  }

  func state() async -> RepositoryState { state }
  func tag() async -> String? { tag }
  func branch() async -> String? { branch }
}

extension Report {
  static func create(state: RepositoryState, tag: String? = nil, branch: String? = nil) async
    -> Report?
  {
    await create(from: TestReportable(state: state, tag: tag, branch: branch))
  }
}

struct ReportGitTest {
  @Test func state_tag() async throws {
    #expect(try #require(await Report.create(state: .noChanges, tag: "name")).description == "name")
  }

  @Test func state_branch() async throws {
    #expect(
      try #require(await Report.create(state: .noChanges, tag: "tag", branch: "branch")).description
        == "tag")
    #expect(
      try #require(await Report.create(state: .noChanges, tag: nil, branch: "branch")).description
        == "branch")
    #expect(
      try #require(await Report.create(state: .noChanges, tag: "", branch: "branch")).description
        == "branch")
  }

  @Test func state_branchEmpty() async throws {
    #expect(
      try #require(await Report.create(state: .noChanges, tag: "tag", branch: "")).description
        == "tag")
    #expect(await Report.create(state: .noChanges, tag: nil, branch: "") == nil)
    #expect(await Report.create(state: .noChanges, tag: "", branch: "") == nil)
  }
}
