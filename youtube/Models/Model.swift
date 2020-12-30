//
//  Model.swift
//  youtube
//
//  Created by VV on 2020-12-27.
//

import Foundation

protocol ModelDelegate {
    func VideosFetched(_ videos:[Video])
    
}

class Model {
    
    var delegate:ModelDelegate?
    
    
    func getVideo() {
        
        //create a url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //get a URLsession object
        let session = URLSession.shared
        
        //get a data task from the URLsession object
        let datatask = session.dataTask(with: url!)  { (data, response, error) in
            //check errors
            if error != nil || data == nil {
                return
            
            }
   
            //parsing the data into video object
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)

                if response.items != nil{
                    DispatchQueue.main.async {
                        self.delegate?.VideosFetched(response.items!)
                    }
                    
                }
                
                //dump(response)
            }
            catch{
                
            }
            
        }
        
        //kick of the task
        datatask.resume()
    }
}
