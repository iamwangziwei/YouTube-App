//
//  DetailViewController.swift
//  youtube
//
//  Created by VV on 2020-12-29.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
 
    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var textview: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textview.text = ""
        
        //check if there is a video
        guard video != nil else {
            return
        }
        
        //create the embed url
        let embedurlstring = Constants.YT_EMBED_URL + video!.videoId
        
        //load into the webview
        let url = URL(string: embedurlstring)
        let request = URLRequest(url: url!)
        webview.load(request)
        
        //set the title
        titleLabel.text = video!.title
        
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //set the discription
        textview.text = video!.description
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



