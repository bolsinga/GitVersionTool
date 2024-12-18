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
  @Test func state_noName() async throws {
    #expect(await Report(state: .invalid, name: nil) == nil)
    #expect(await Report(state: .localChanges, name: nil) == nil)
    #expect(await Report(state: .noChanges, name: nil) == nil)
  }

  @Test func state_emptyName() async throws {
    #expect(await Report(state: .invalid, name: "") == nil)
    #expect(await Report(state: .localChanges, name: "") == nil)
    #expect(await Report(state: .noChanges, name: "") == nil)
  }

  @Test func state_name() async throws {
    #expect(await Report(state: .invalid, name: "name") == nil)
    #expect(
      try #require(await Report(state: .localChanges, name: "name")).description == "name-local")
    #expect(try #require(await Report(state: .noChanges, name: "name")).description == "name")
  }

  @Test func state_funkyName() async throws {
    #expect(try #require(await Report(state: .noChanges, name: "name\ntwo")).description == "name")
  }
}
