//
//  Data+Decode.swift
//  
//
//  Created by Salihcan Kahya on 17.02.2021.
//

import Foundation

extension Data {
    public func toDecodable<T: Decodable>(type: T.Type) -> T? {
        try? JSONDecoder().decode(type.self, from: self)
    }
}
