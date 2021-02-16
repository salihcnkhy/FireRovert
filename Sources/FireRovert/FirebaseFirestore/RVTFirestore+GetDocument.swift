//
//  RVTFirestore+GetDocument.swift
//  
//
//  Created by Salihcan Kahya on 17.02.2021.
//

import Foundation

extension RVTFirestore {
    public func getDocument(in collection: String, named document: String, with completion: @escaping (ResponseWrapper) -> Void ) {
        db.collection(collection).document(document).getDocument { (snapshot, error) in
            if let err = error {
                completion(.init(data: [ErrorResponse(message: err.localizedDescription)]))
            } else if let snapshotData = snapshot?.data() {
                if let data = snapshotData.toJsonData() {
                    if let decoded = data.toDecodable(type: T.self) {
                        completion(.init(data: [decoded]))
                    } else {
                        completion(.init(data: [ErrorResponse(message: ErrorType.decodeError.rawValue)]))
                    }
                } else {
                    completion(.init(data: [ErrorResponse(message: ErrorType.dictionaryTodataConvertError.rawValue)]))
                }
            } else {
                completion(.init(data: [ErrorResponse(message: ErrorType.nilSnapshot.rawValue)]))
            }
        }
    }
    
    public func getAll(in collection: String, with completion: @escaping (ResponseWrapper) -> Void) {
        db.collection(collection).getDocuments { (querySnapshot, error) in
            if let err = error {
                completion(.init(data: [ErrorResponse(message: err.localizedDescription)]))
            } else if let querySnapshot = querySnapshot {
                var responseArray = [ResponseProtocol]()
                querySnapshot.documents.forEach { doc in
                    if let data = doc.data().toJsonData() {
                        if let decoded = data.toDecodable(type: T.self) {
                            responseArray.append(decoded)
                        } else {
                            completion(.init(data: [ErrorResponse(message: ErrorType.decodeError.rawValue)]))
                        }
                    } else {
                        completion(.init(data: [ErrorResponse(message: ErrorType.dictionaryTodataConvertError.rawValue)]))
                    }
                }
                completion(.init(data: responseArray))
            } else {
                completion(.init(data: [ErrorResponse(message: ErrorType.nilSnapshot.rawValue)]))
            }
        }
    }
}
