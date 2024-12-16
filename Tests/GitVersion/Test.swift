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
  @Test func localChanges_noTag() throws {
    #expect("\(Report(localChanges: true))" == "local")
    #expect("\(Report(localChanges: false))" == "version")
  }

  @Test func localChanges_tag() throws {
    #expect("\(Report(localChanges: true, tag: "tag"))" == "tag-local")
    #expect("\(Report(localChanges: false, tag: "tag"))" == "tag")
  }
}
