//
//  Team+CoreDataClass.swift
//  soccerTeams
//
//  Created by Carlos Flores Guardado on 11/6/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class Team: NSManagedObject {

    func setTeamImg(_ img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data as NSData?
    }
    
    func getTeamImg() -> UIImage {
        let img = UIImage(data: self.image! as Data)!
        return img
    }

    
}
