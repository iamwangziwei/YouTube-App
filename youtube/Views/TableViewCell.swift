//
//  TableViewCell.swift
//  youtube
//
//  Created by VV on 2020-12-29.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setcell(_ v:Video){
        self.video = v
        
        
        // ensure the video not nil
        guard video != nil else {
            return
        }
        
        //set the title and date lable
        self.titleLable.text = video?.title
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dataLabel.text = df.string(from: video!.published)
        
        //set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //check cache before downloading data
        if let cacheddata = CacheManager.getvideocache(self.video!.thumbnail){
            //set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cacheddata)
            return
        }
        
        //download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //get the shared url session object
        let session = URLSession.shared
        
        //create a data task
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil
            {
                //save the data in the cache
                CacheManager.setvideocache(url!.absoluteString, data)
                
                
                //check that the download url matches the video thumbnail url that
                //this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail{return}
                
                //create the image object
                let image = UIImage(data: data!)
                
                //set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            
            }
        }
        
        //start data task
        datatask.resume()
    }
}
