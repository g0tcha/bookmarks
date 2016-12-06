//
//  SCWSError.swift
//  SayCheese
//
//  Created by vincent on 01/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import Foundation

enum WebServiceError {
    // -- User.
    case loginBadCredentials
    case userAlreadyExists
    
    // -- URL.
    case cannotCreateURL
    
    // -- JSON.
    case jsonCreation
    case jsonResponseParsing
    
    // -- Network
    case networkError
    
    func message() -> String {
        switch self {
        case .loginBadCredentials:
            return NSLocalizedString("error_bad_credentials", comment: "Error: User doesn't exists")
        case .userAlreadyExists:
            return NSLocalizedString("error_user_exists", comment: "Error: User already exists.")
        case .cannotCreateURL:
            return NSLocalizedString("error_cannot_create_url", comment: "Error: URL cannot be created")
        case .networkError:
            return NSLocalizedString("error_network", comment: "Error: Network error")
        case .jsonCreation:
            return NSLocalizedString("error_json_creation", comment: "Error: JSON Creation")
        case .jsonResponseParsing:
            return NSLocalizedString("error_json_parsing", comment: "Error: JSON Response Parsing")
        }
    }
}
