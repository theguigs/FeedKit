//
//  OthersDateFormatter.swift
//  FeedKit
//
//  Created by Guillaume Audinet on 28/12/2020.
//

import Foundation

/// Converts date and time textual representations within the ISO8601
/// date specification into `Date` objects
class OthersDateFormatter: DateFormatter {
    let dateFormats = [
        "yyyy-MM-dd HH:mm:ss",
    ]
    
    override init() {
        super.init()
        self.timeZone = TimeZone(secondsFromGMT: 0)
        self.locale = Locale(identifier: "en_US_POSIX")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not supported")
    }
    
    override func date(from string: String) -> Date? {
        let string = string.trimmingCharacters(in: .whitespacesAndNewlines)
        for dateFormat in self.dateFormats {
            self.dateFormat = dateFormat
            if let date = super.date(from: string) {
                return date
            }
        }
        
        return nil
    }
}
