//
//  RVTFirestore+AddDocument.swift
//  
//
//  Created by Salihcan Kahya on 17.02.2021.
//

import Foundation

extension RVTFirestore {
    public func add(in collection: String, which documentID: String, with data: T, merge: Bool = true, completion: ((Error?) -> Void)? = nil) {
        if let dictionary = data.dictionary {
            db.collection(collection).document(documentID).setData(dictionary, merge: true, completion: completion)
        } else {
            completion?(ErrorResponse(message: ErrorType.dataToDictionaryConvertError.rawValue))
        }
    }
    
    public func add(in collection: String, with data: T, completion: ((Error?) -> Void)? = nil) {
        if let dictionary = data.dictionary {
            db.collection(collection).addDocument(data: dictionary, completion: completion)
        } else {
            completion?(ErrorResponse(message: ErrorType.dataToDictionaryConvertError.rawValue))
        }
    }
}
