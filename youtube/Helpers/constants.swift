//
//  constants.swift
//  youtube
//
//  Created by VV on 2020-12-27.
//



//add your own API_KEY and PLAYLIST_ID

import Foundation

struct  Constants {
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLDIXF8nb0VG1v4S-smVy7GV0MHsJ3PJiL"
    static var API_URL =  "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var VIDEOCELL_ID = "videocell"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
}
