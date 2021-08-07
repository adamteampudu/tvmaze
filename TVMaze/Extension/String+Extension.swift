//
//  String+Extension.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//


// taken from:
// https://stackoverflow.com/questions/37048759/swift-display-html-data-in-a-label-or-textview

import Foundation

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
