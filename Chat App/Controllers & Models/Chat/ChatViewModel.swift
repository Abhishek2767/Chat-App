//
//  ChatViewModel.swift
//  Chat App
//
//  Created by SST PC on 05/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


protocol ChatProtocol {
    var router: RouterProtocol { get }
    var channelId: String! { get }
    var curentUserID: String! { get }
    
    
    func sendMessage(message: String)
}

class ChatViewModel: ChatProtocol {
    
    var router: RouterProtocol
    var receiverData: ContactModel
    
    var channelId : String!
    var curentUserID : String!
    
    

    init(router: RouterProtocol, receiverData: ContactModel) {
        self.router = router
        self.receiverData = receiverData
    }
    
    
    func sendMessage(message: String) {
        
        if validateWhiteSpace(message) {
            chatChannelReference.document(channelId).getDocument { snapshot, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                if snapshot?.data() == nil {
                    self.createNewChannel(message: message)
                } else {
                    self.addChatToGroupMessage(message: message, needToUpdateLastMessage: true)
                }
            }
        }
    }
    
    
    func createNewChannel(message: String) {
        let memberIDs = [curentUserID, receiverData.userID]
        let currentTime = Utility.getCurrentTime()
        
        let dict: [String: Any] = [
            Keys.channelId: channelId ?? "",
            Keys.createdAt: currentTime,
            Keys.isDeleted: false,
            Keys.memberIds: memberIDs,
            Keys.message: message,
            Keys.modifiedAt: currentTime,
            Keys.receiverId: receiverData.userID,
            Keys.senderId: curentUserID ?? ""
        ]
        
        chatChannelReference.document(channelId).setData(dict) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
           
            
            self.addChatToGroupMessage(message: message)
        }
    }
    
    func addChatToGroupMessage(message: String, needToUpdateLastMessage: Bool = false) {
        
        let chatID = chatChannelReference.document(channelId).collection(Constants.subNodeGroupMessage).document().documentID
        
        let messageDict: [String: Any] = [
            Keys.chatID: chatID,
            Keys.message: message,
            Keys.isDeleted: false,
            Keys.messageType: "text",
            Keys.messageTime: Utility.getCurrentTime(),
            Keys.senderId: curentUserID ?? "",
            Keys.serverTime : FieldValue.serverTimestamp()
        ]
            
        chatChannelReference.document(channelId).collection(Constants.subNodeGroupMessage).document(messageDict["chatID"] as? String ?? "")
            .setData(messageDict) { error in
                
                if error == nil {
                    if needToUpdateLastMessage {
                        chatChannelReference.document(self.channelId).updateData([Keys.message : message, Keys.modifiedAt : Utility.getCurrentTime()])
                    }
                    self.updateReadCount(messageDic: messageDict)
                }
            }
        
        
//        for index in 0..<member_id.count  {
//            let memberData : [String:Any] = [
//                roomId : self.userID,
//                memberId: member_id[index],
//                isOnline : false,
//                unreadCount : 0,
//                memberStatus : "active"
//            ]
//            chatchannelReference.document(self.userID).collection(SUB_NODE_CHAT_MEMBER_DATA).document(member_id[index]).setData(memberData) { error in
//                
//                if index == member_id.count - 1
//                {
//                    Utility.hideLoadingView()
//                    let Chat = MainStoryboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
//                    Chat.strReceiverId = self.otherUserID
//                    Chat.strChannelId = self.userID
//                    AppDelegate.classInstance().mainNav.pushViewController(Chat, animated: true)
//                }
//            }
//        }

    }
    
    func updateReadCount(messageDic : [String : Any]) {
        
    }
    
    func validateWhiteSpace(_ str: String?) -> Bool {
        if (str == nil) {
            return false
        }
        
        if  (str?.isKind(of: NSString.self))! {
            let trimmed: String = str!.trimmingCharacters(in: CharacterSet.whitespaces)
            
            if trimmed.count > 0 {
                return true
            }
        }
        
        return false
    }
}
