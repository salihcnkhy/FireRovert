//
//  File.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2021.
//

public struct ResponseWrapper {
    public var data: [ResponseProtocol]
    public var isSuccess: Bool
    public init(data: [ResponseProtocol]) {
        self.data = data
        if let first = data.first, let _ = first as? ErrorResponse {
            isSuccess = false
        } else {
            isSuccess = true
        }
    }
}
