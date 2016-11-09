//
//  ViewController.swift
//  soccerTeams
//
//  Created by Carlos Flores Guardado on 11/6/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var teams = [Team]()
    var passWebsiteUrl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    @IBAction func addTeam(sender: AnyObject){
        performSegue(withIdentifier: "addTeam", sender: nil)
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Team>(entityName: "Team")
        
            do {
                let results = try context.fetch(fetchRequest/* as! NSFetchRequest<NSFetchRequestResult>*/)
                self.teams = results //as! [Team]
            } catch let err as NSError {
                print(err.debugDescription)
            }
        }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell") as? TeamCell {
            let team = teams[(indexPath as NSIndexPath).row]
            cell.configureCell(team)
            return cell
        } else {
            return TeamCell()
        }

    }
    
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            teams.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }*/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!) as! TeamCell
        
        passWebsiteUrl = currentCell.teamWebsite.text!
        performSegue(withIdentifier: "goToWebsite", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWebsite" {
            let destinationVC = segue.destination as! websiteVC
            destinationVC.passedWebsiteUrl = passWebsiteUrl
        }
    }
}


