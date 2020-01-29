//
//  MessageService.swift
//  Slack
//
//  Created by Vladimir on 28.01.2020.
//  Copyright © 2020 Vladimir Tambovtsev. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    var messages = [Message]()
    var unreadChannels = [String]()
    var selectedChannel : Channel?
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        
        Alamofire
           .request(URL_CHANNELS_GET, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER_BEARER)
           .responseJSON { (response) in
               if response.result.error == nil {
                   
                   // Using Swifty JSON
                   guard let data = response.data else { return }
                   if let json = try? JSON(data: data).array {
                    
                    for item in json {
                        let id = item["_id"].stringValue
                        let name = item["name"].stringValue
                        let description = item["description"].stringValue
                        
                        let channel = Channel(id: id, channelTitle: name, channelDescription: description)
                        
                        self.channels.append(channel)
                    }
                   }
                   
                    NotificationCenter.default.post(name: NOTIFICATION_CHANNELS_LOADED, object: nil)
                   completion(true)
               } else {
                   completion(false)
                   debugPrint(response.result.error as Any)
               }
           }
    }
    
    func findAllMessageForChannel(channelId: String, completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER_BEARER).responseJSON { (response) in
            
            if response.result.error == nil {
                self.clearMessages()
                guard let data = response.data else { return }
                
                 if let json = try? JSON(data: data).array {
                                
                    for item in json {
                        let messageBody = item["messageBody"].stringValue
                        let channelId = item["channelId"].stringValue
                        let id = item["_id"].stringValue
                        let userName = item["userName"].stringValue
                        let userAvatar = item["userAvatar"].stringValue
                        let userAvatarColor = item["userAvatarColor"].stringValue
                        let timeStamp = item["timeStamp"].stringValue
                        
                        let message = Message(id: id, message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, timeStamp: timeStamp)
                        self.messages.append(message)
                    }
                    print(self.messages)
                    completion(true)
                }
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
        
    func clearMessages() {
        messages.removeAll()
    }
    
    func clearChannels() {
        channels.removeAll()
    }
}
