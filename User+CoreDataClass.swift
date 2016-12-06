//
//  User+CoreDataClass.swift
//  SayCheese
//
//  Created by vincent on 05/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import Foundation
import CoreData


public class User: NSManagedObject {
    static let loggedInUserKey = ""
    
    // -- Extract json data.
    static func extractAndSaveUser(fromJSON userInfo: [String: Any], withPassword password: String) -> NSManagedObjectID? {
        if let fullName = userInfo["fullName"] as? String, let userName = userInfo["userName"] as? String, let email = userInfo["email"] as? String {
            let user = User(context: context)
            user.fullName = fullName
            user.userName = userName
            user.email    = email
            user.password = password
            
            ad.saveContext()
            return user.objectID
        }
        return nil
    }
    
    // -- Save logged user in UserDefaults.
    static func saveLogged(objectID: NSManagedObjectID) {
        removeLogged()
        
        let defaults = UserDefaults.standard
        defaults.set(objectID.uriRepresentation(), forKey: loggedInUserKey)
        defaults.synchronize()
    }
    
    // -- Remove logged user from UserDefaults.
    static func removeLogged() {
        let defaults = UserDefaults.standard
        if let _ = defaults.url(forKey: loggedInUserKey) {
            defaults.removeObject(forKey: loggedInUserKey)
        }
    }
    
    // -- Get user last loggin info.
    static func getLastLogged() -> User? {
        let defaults = UserDefaults.standard
        
        if let objectIDURL = defaults.url(forKey: loggedInUserKey) {
            if let objectID = context.persistentStoreCoordinator!.managedObjectID(forURIRepresentation: objectIDURL) {
                do {
                    if let user = try context.existingObject(with: objectID) as? User {
                        print(user)
                        return user
                    }
                } catch {
                    return nil
                }
            }
            
        }
        
        return nil
    }
}
