//
//  Dictionary+Data.swift
//  
//
//  Created by Salihcan Kahya on 17.02.2021.
//

import Foundation

extension Dictionary {
    public func toJsonData(options: JSONSerialization.WritingOptions = .prettyPrinted) -> Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: options)
    }
}
