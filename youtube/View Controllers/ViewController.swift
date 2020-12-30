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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

