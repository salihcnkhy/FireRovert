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
}

