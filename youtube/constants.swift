//
//  constants.swift
//  youtube
//
//  Created by VV on 2020-12-27.
//

import Foundation

struct  Constants {
    static var API_KEY = "AIzaSyBwl_NTPIsBxjJlK_Ye1BTeKH706L3aXQg"
    static var PLAYLIST_ID = "PLMRqhzcHGw1YqPh-ggQHJPAUxdHov_uNJ"
    static var API_URL =  "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
