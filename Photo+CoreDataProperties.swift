//
//  Photo+CoreDataProperties.swift
//  Galleria
//
//  Created by Pramodya Abeysinghe on 31/3/19.
//  Copyright © 2019 Pramodya. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var textTitle: String?
    @NSManaged public var textDescription: String?
    @NSManaged public var image: NSData?

}
