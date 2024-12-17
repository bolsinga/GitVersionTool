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
    #expect(try #require(Report(state: .invalid, name: nil)).description == "unknown")
    #expect(Report(state: .localChanges, name: nil) == nil)
    #expect(Report(state: .noChanges, name: nil) == nil)
  }

  @Test func state_emptyName() throws {
    #expect(try #require(Report(state: .invalid, name: "")).description == "unknown")
    #expect(Report(state: .localChanges, name: "") == nil)
    #expect(Report(state: .noChanges, name: "") == nil)
  }

  @Test func state_name() throws {
    #expect(try #require(Report(state: .invalid, name: "name")).description == "unknown")
    #expect(try #require(Report(state: .localChanges, name: "name")).description == "name-local")
    #expect(try #require(Report(state: .noChanges, name: "name")).description == "name")
  }

  @Test func state_funkyName() throws {
    #expect(try #require(Report(state: .noChanges, name: "name\ntwo")).description == "name")
  }
}
