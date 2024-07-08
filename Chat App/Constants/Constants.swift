//
//  Constants.swift
//  Chat App
//
//  Created by SST PC on 08/07/24.
//

import Foundation
import FirebaseFirestore


let db = Firestore.firestore()
let userReference = db.collection(Constants.users)
let chatChannelReference = db.collection(Constants.channels)
let chatMemberData = db.collectionGroup(Constants.subNodeChatMemberData)
