//
//  Message.swift
//  Slack
//
//  Created by Vladimir on 28.01.2020.
//  Copyright © 2020 Vladimir Tambovtsev. All rights reserved.
//

import Foundation

struct Message {
    public private(set) var id: String!
    public private(set) var message: String!
    public private(set) var userName: String!
    public private(set) var channelId: String!
    public private(set) var userAvatar: String!
    public private(set) var userAvatarColor: String!
    public private(set) var timeStamp: String!
}
