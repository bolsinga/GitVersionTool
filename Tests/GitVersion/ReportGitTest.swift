//
//  ReportGitTest.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/17/24.
//

import Foundation
import Testing

@testable import GitVersion

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
