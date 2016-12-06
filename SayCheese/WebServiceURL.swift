//
//  WebserviceSettings.swift
//  SayCheese
//
//  Created by vincent on 01/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import Foundation

struct WebServiceURL {
    struct User {
        static let create = "http://127.0.0.1:3000/api/user"
        static let login = "http://127.0.0.1:3000/api/user/login"
        static let getPosts = "http://127.0.0.1:3000/api/user/:user_object_id/posts"
    }
    
    struct Post {
        static let create = "http://127.0.0.1:3000/api/post"
        static let remove = "http://127.0.0.1:3000/api/post"
        static let createComment = "http://127.0.0.1:3000/api/post/comment"
        static let removeComment = "http://127.0.0.1:3000/api/post/:post_object_id/comments"
    }
}
