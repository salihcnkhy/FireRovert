//
//  RVTFirestore.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2021.
//

import Foundation
import FirebaseFirestore
import Firebase

public struct RVTFirestore<T: ResponseProtocol> {
    
    let db: Firestore
    
    public init() {
        guard let app = FirebaseApp.app()
        else { fatalError("You have to configure firebase at appDelegate") }
        self.db = Firestore.firestore(app: app)
    }
    
    public func getDocument(in collection: String, named document: String, with completion: @escaping (ResponseWrapper) -> Void ) {
        db.collection(collection).document(document).getDocument { (snapshot, error) in
            if let err = error {
                completion(.init(data: ErrorResponse(message: err.localizedDescription)))
            } else if let snapshotData = snapshot?.data(),
                      let data = try? JSONSerialization.data(withJSONObject: snapshotData, options: .prettyPrinted) {
                if let decoded = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.init(data: decoded))
                } else {
                    completion(.init(data: ErrorResponse(message: ErrorType.decodeError.rawValue)))
                }
            }
        }
    }
    
}
