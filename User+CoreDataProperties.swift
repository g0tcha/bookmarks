//
//  User+CoreDataProperties.swift
//  SayCheese
//
//  Created by vincent on 05/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var fullName: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var userName: String?

}
