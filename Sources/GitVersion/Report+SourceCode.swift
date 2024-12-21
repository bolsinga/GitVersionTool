//
//  Report+SourceCode.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/18/24.
//

import Foundation

extension Report {
  public static func emit<T: Reportable>(reportable: T, variable: String?) async -> String {
    if let report = await Self.create(from: reportable) {
      if let variable {
        return variable.sourceCode(value: report.description)
      } else {
        return report.description
      }
    } else {
      if let variable {
        return variable.errorSourceCode
      } else {
        return SourceCodeError
      }
    }
  }
}
