//
//  String+regex.swift
//  meowleUITests

import Foundation

extension String {
	func matches(for regex: String) -> [String] {
		do {
			let regex = try NSRegularExpression(pattern: regex)
			let results = regex.matches(in: self,
										range: NSRange(self.startIndex..., in: self))
			return results.map {
				if let range = Range($0.range, in: self) {
					return String(self[range])
				}
				return ""
			}
		} catch let error {
			print("invalid regex: \(error.localizedDescription)")
			return []
		}
	}
}
