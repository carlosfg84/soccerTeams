//
//  websiteVC.swift
//  soccerTeams
//
//  Created by Carlos Flores Guardado on 11/7/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import UIKit
import WebKit

class websiteVC: UIViewController {

    @IBOutlet weak var container: UIView!
    
    var webView: WKWebView!
    var passedWebsiteUrl: String!
    var https = "https://"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView()
        container.addSubview(webView)
       
        
    }

    override func viewDidAppear(_ animated: Bool) {
        let frame = CGRect(x: 0.0, y: 0.0, width: container.bounds.width, height: container.bounds.height)
        webView.frame = frame
        
        let urlString = https + passedWebsiteUrl
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    
    @IBAction func backBtn(sender: AnyObject) {
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
