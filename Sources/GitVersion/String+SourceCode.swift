//
//  String+SourceCode.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/18/24.
//

import Foundation

let SourceCodeError = "#error"

extension String {
  func sourceCode(value: String) -> String {
    "let \(self) = \"\(value)\""
  }

  var errorSourceCode: String {
    "let \(self) = \(SourceCodeError)"
  }
}
