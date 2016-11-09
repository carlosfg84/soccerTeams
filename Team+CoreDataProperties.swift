//
//  Team+CoreDataProperties.swift
//  soccerTeams
//
//  Created by Carlos Flores Guardado on 11/6/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import Foundation
import CoreData


extension Team {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Team> {
        return NSFetchRequest<Team>(entityName: "Team");
    }

    @NSManaged public var name: String?
    @NSManaged public var image: NSData?
    @NSManaged public var website: String?

}
