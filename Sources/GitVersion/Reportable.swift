//
//  Reportable.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/17/24.
//

import Foundation

public protocol Reportable {
  func state() async -> RepositoryState
  func tag() async -> String?
  func branch() async -> String?
  func commit() async -> String?
}
