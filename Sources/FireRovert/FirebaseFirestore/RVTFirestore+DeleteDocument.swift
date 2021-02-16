//
//  File.swift
//  
//
//  Created by Salihcan Kahya on 17.02.2021.
//

import Foundation

extension RVTFirestore {
    public func deleteDocument(in collection: String, named document: String, completion: ((Error?) -> Void)?) {
        db.collection(collection).document(document).delete(completion: completion)
    }
    
    public func deleteDocument(in collection: String, where field: String, is equalTo: Any) {
        db.collection(collection).whereField(field, isEqualTo: equalTo)
    }
}
