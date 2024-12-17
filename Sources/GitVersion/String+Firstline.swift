//
//  String+Firstline.swift
//  GitVersion
//
//  Created by Greg Bolsinga on 12/17/24.
//

extension String {
  var firstLine: String {
    components(separatedBy: "\n")[0]
  }
}
