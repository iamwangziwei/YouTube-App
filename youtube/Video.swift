//
//  Video.swift
//  youtube
//
//  Created by VV on 2020-12-27.
//

import Foundation

struct Video: Decodable{
    
    var videoID = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourceId
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoID
    
    }
    
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy:CodingKeys.self )
        let snippetcontainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parse title
        self.title = try snippetcontainer.decode(String.self, forKey: .title)
        //parse description
        self.description  = try snippetcontainer.decode(String.self, forKey: .description)
        
        //parse the published  date
        self.published = try snippetcontainer.decode(Date.self, forKey: .published)
        
        //parse the thumbnail
        let thumbnailcontainer = try snippetcontainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highcontainer = try thumbnailcontainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highcontainer.decode(String.self, forKey: .thumbnail)
        
        //parse video id
        let resourceidcontainer  = try snippetcontainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoID = try resourceidcontainer.decode(String.self, forKey: .videoID)
    }
    
}
