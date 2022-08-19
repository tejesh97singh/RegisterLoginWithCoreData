//
//  LoginDetails+CoreDataProperties.swift
//  RegisterLoginCoreData
//
//  Created by Tejesh Singh on 17/06/22.
//
//

import Foundation
import CoreData


extension LoginDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginDetails> {
        return NSFetchRequest<LoginDetails>(entityName: "LoginDetails")
    }

    @NSManaged public var email: String?
    @NSManaged public var image: Data?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension LoginDetails : Identifiable {

}
