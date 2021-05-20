

import Foundation

import Foundation


protocol ModelDelegate {
    func videoFetched (_ videos: [Video])
}




class Model {
    
    
    var delegate: ModelDelegate?
    
    
    
    func gitVideo()
    {
        
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{return}
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, responnse, error) in
          
            //check if there were any errors
            if (error != nil || data == nil)
            {
                return
            }
            //parcing data into video object
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                          
                let response = try decoder.decode(Response.self, from: data!)
                
                
                if response.items != nil{
                //call the video fetched method of the delegate
                self.delegate?.videoFetched(response.items!)
                }
                
                dump(response)
            }
            catch{
                print("error")
            }
            
        }
        
        //kick of the data task
        dataTask.resume()
        
    }
    
}
