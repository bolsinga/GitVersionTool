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
  @Test func state_tag() throws {
    #expect("\(Report.create(state: .noChanges, tag: "name"))" == "name")
  }

  @Test func state_branch() throws {
    #expect("\(Report.create(state: .noChanges, tag: "tag", branch: "branch"))" == "tag")
    #expect("\(Report.create(state: .noChanges, tag: nil, branch: "branch"))" == "branch")
    #expect("\(Report.create(state: .noChanges, tag: "", branch: "branch"))" == "branch")
  }

  @Test func state_branchEmpty() throws {
    #expect("\(Report.create(state: .noChanges, tag: "tag", branch: ""))" == "tag")
    #expect("\(Report.create(state: .noChanges, tag: nil, branch: ""))" == "version")
    #expect("\(Report.create(state: .noChanges, tag: "", branch: ""))" == "version")
  }
}
