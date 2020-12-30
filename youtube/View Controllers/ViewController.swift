//
//  ViewController.swift
//  youtube
//
//  Created by VV on 2020-12-27.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,ModelDelegate {
    
    
    

    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    var model = Model()
    var videos = [Video]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set itself as the datasource and the delegate
        tableview.dataSource = self
        tableview.delegate = self
        
        //set itself as the delegate of the model
        model.delegate = self
        
        model.getVideo()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Confirm that a video was selected
        guard tableview.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get a reference to the video that was tapped on
        let selectedVideo = videos[tableview.indexPathForSelectedRow!.row]
        
        // Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        // Set the video property of the detail view controller
        detailVC.video = selectedVideo
    }
    
    
    //mark : model delegate methods
    func VideosFetched(_ videos: [Video]) {
        //set the return video to  video property
        self.videos = videos
        
        //refresh the tableview
        tableview.reloadData()
    }
    
    //mark:  tableview method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as!TableViewCell
        
        //configure the cell with data
        
       
        let video = self.videos[indexPath.row]
        cell.setcell(video)
        
        //return the cell
        return cell
    }


}

