//
//  ReportEmitTest.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/18/24.
//

import Testing

@testable import GitVersion

private struct EmitTestReportable: Reportable {
  let state: RepositoryState
  let tag: String?

  internal init(state: RepositoryState, tag: String? = nil) {
    self.state = state
    self.tag = tag
  }

  func state() async -> RepositoryState { state }
  func tag() async -> String? { tag }
  func branch() async -> String? { nil }
  func commit() async -> String? { nil }
}

struct ReportEmitTest {
  @Test func emit() async throws {
    #expect(
      await Report.emit(reportable: EmitTestReportable(state: .invalid), variable: nil) == "#error")
    #expect(
      await Report.emit(reportable: EmitTestReportable(state: .invalid), variable: "variable")
        == "public let variable = #error")
    #expect(
      await Report.emit(reportable: EmitTestReportable(state: .noChanges), variable: nil)
        == "#error")
    #expect(
      await Report.emit(
        reportable: EmitTestReportable(state: .noChanges, tag: "name"), variable: nil) == "name")
    #expect(
      await Report.emit(
        reportable: EmitTestReportable(state: .noChanges, tag: "name"), variable: "variable")
        == "public let variable = \"name\"")
  }
}
