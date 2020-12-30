//
//  CacheManager.swift
//  youtube
//
//  Created by VV on 2020-12-29.
//

import Foundation

class CacheManager{
    static var cache = [String:Data]()
    
    static func setvideocache(_ url:String, _ data:Data?)
    {
        cache[url] = data
    }
    
    static func getvideocache(_ url : String) ->Data?{
        return cache[url]
    }
    
}
