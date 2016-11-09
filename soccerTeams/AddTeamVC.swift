//
//  AddTeamVC.swift
//  soccerTeams
//
//  Created by Carlos Flores Guardado on 11/6/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import UIKit
import CoreData

class AddTeamVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var teamName: UITextField!
    @IBOutlet weak var teamWebsite: UITextField!
    @IBOutlet weak var addImgBtn: UIButton!
    
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        teamImg.layoutIfNeeded()
        teamImg.layer.cornerRadius = teamImg.frame.height / 2.0
        teamImg.clipsToBounds = true
        
        
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        teamImg.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
        addImgBtn.setTitle("", for: UIControlState())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addImg(sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addTeam(sender: AnyObject) {
        if let name = teamName.text , name != "" {
            
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Team", in: context)
            let team = Team(entity: entity!, insertInto: context)
            team.name = teamName.text
            team.website = teamWebsite.text
            team.setTeamImg(teamImg.image!)
            
            //context.insert(team)
            
            do {
                try context.save()
                
            } catch {
                print("Could not save recipe")
            }
            
            dismiss(animated: true, completion: nil)
        }

    }
    
    @IBAction func cancelBtn(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
