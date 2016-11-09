//
//  TeamCell.swift
//  soccerTeams
//
//  Created by Carlos Flores Guardado on 11/6/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamWebsite: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        teamImage.layoutIfNeeded()
        teamImage.layer.cornerRadius = teamImage.frame.width / 2.0
        teamImage.clipsToBounds = true
        
    }

    func configureCell(_ team: Team) {
        teamName.text = team.name
        teamWebsite.text = team.website
        teamImage.image = team.getTeamImg()
    }
    
}
