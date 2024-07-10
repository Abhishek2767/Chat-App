//
//  ContactsViewModel.swift
//  WhatsApp Chat
//
//  Created by Abhishek on 07/07/24.
//

import Foundation
import FirebaseFirestore

protocol ContactsProtocol {
    var router: RouterProtocol { get }
    var contacts: [UserModel] { get }
    
    
    func fetchAllUsers(completion: @escaping (String?) -> Void)
}

class ContactsViewModel: ContactsProtocol {
    
    var router: RouterProtocol
    var contacts: [UserModel] = []
    
    let db = Firestore.firestore()
    
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    
    func fetchAllUsers(completion: @escaping (String?) -> Void) {
        let usersCollection = db.collection("users")
        
        usersCollection.getDocuments { (querySnapshot, error) in
            if let error = error {
                completion("Error fetching users: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                completion("No documents found.")
                return
            }
            
            // Map documents to UserModel objects
            var fetchedContacts: [UserModel] = []
            
            documents.forEach { document in
                do {
                    // Attempt to decode document into UserModel
                    let contact = try document.data(as: UserModel.self)
                    fetchedContacts.append(contact)
                } catch {
                    print("Error decoding user data for document \(document.documentID): \(error.localizedDescription)")
                }
            }
            
            // Update contacts and call completion handler
            self.contacts = fetchedContacts
            completion(nil)
        }
    }
}
