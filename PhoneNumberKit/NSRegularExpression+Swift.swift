//
//  NSRegularExpression+Swift.swift
//  PhoneNumberKit
//
//  Created by David Beck on 8/15/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import Foundation

extension String {
	func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
	}
	
	func range(from nsRange: NSRange) -> Range<String.Index>? {
        return Range(nsRange, in: self)
	}
}


extension NSRegularExpression {
	func enumerateMatches(in string: String, options: NSRegularExpression.MatchingOptions = [], range: Range<String.Index>? = nil, using block: (NSTextCheckingResult?, NSRegularExpression.MatchingFlags, UnsafeMutablePointer<ObjCBool>) -> Swift.Void) {
		let range = range ?? string.startIndex..<string.endIndex
		let nsRange = string.nsRange(from: range)
		
		self.enumerateMatches(in: string, options: options, range: nsRange, using: block)
	}
	
	func matches(in string: String, options: NSRegularExpression.MatchingOptions = [], range: Range<String.Index>? = nil) -> [NSTextCheckingResult] {
		let range = range ?? string.startIndex..<string.endIndex
		let nsRange = string.nsRange(from: range)
		
		return self.matches(in: string, options: options, range: nsRange)
	}
	
	func numberOfMatches(in string: String, options: NSRegularExpression.MatchingOptions = [], range: Range<String.Index>? = nil) -> Int {
		let range = range ?? string.startIndex..<string.endIndex
		let nsRange = string.nsRange(from: range)
		
		return self.numberOfMatches(in: string, options: options, range: nsRange)
	}
	
	func firstMatch(in string: String, options: NSRegularExpression.MatchingOptions = [], range: Range<String.Index>? = nil) -> NSTextCheckingResult? {
		let range = range ?? string.startIndex..<string.endIndex
		let nsRange = string.nsRange(from: range)
		
		return self.firstMatch(in: string, options: options, range: nsRange)
	}
	
	func rangeOfFirstMatch(in string: String, options: NSRegularExpression.MatchingOptions = [], range: Range<String.Index>? = nil) -> Range<String.Index>? {
		let range = range ?? string.startIndex..<string.endIndex
		let nsRange = string.nsRange(from: range)
		
		let match = self.rangeOfFirstMatch(in: string, options: options, range: nsRange)
		
		return string.range(from: match)
	}
	
	func stringByReplacingMatches(in string: String, options: NSRegularExpression.MatchingOptions = [], range: Range<String.Index>? = nil, withTemplate templ: String) -> String {
		let range = range ?? string.startIndex..<string.endIndex
		let nsRange = string.nsRange(from: range)
		
		return self.stringByReplacingMatches(in: string, options: options, range: nsRange, withTemplate: templ)
	}
}
