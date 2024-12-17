//
//  Report+Reportable.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/17/24.
//

import Foundation

extension Report {
  static func create<T: Reportable>(from reportable: T) async -> Report? {
    await Report(state: await reportable.state()) { await reportable.name() }
  }
}
