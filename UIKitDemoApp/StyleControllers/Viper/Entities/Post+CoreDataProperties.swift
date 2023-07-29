//
//  Post+CoreDataProperties.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/20.
//
//

import Foundation
import CoreData


extension Post {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var id: Int32
    @NSManaged public var imageUrl: String?
    @NSManaged public var thumbImageUrl: String?
    @NSManaged public var title: String?
    @NSManaged public var detail: String?

}

extension Post : Identifiable {

}
