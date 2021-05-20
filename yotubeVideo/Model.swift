import Foundation


protocol ModelDelegate {
    func videoFetched (_ videos: [Video])
}
class Model {
    
    var delegate: ModelDelegate?
    
    
    
    func gitVideo()
    {
        let url = URL(string: "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLp22-4PivYmIsCOWJ0D8lXBsbKfcyc3So&key=AIzaSyAoewpVnxHfj_4An6k5MaKdVNWIXCFP6VU")
       
        guard url != nil else{return}

        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in

            //check if there were any errors
            if (error != nil || data == nil )
            {
                return
            }
            //parcing data into video object
            

            do {
              let decoder = JSONDecoder()
              decoder.dateDecodingStrategy = .iso8601

               let response = try decoder.decode(Response.self, from: data!)
                dump(response)
                
                
//                if response.items != nil
//                {
//                //call the video fetched method of the delegate
//                self.delegate?.videoFetched(response.items!)
            }
            catch
            {
            }
            
        }
        
        //kick of the data task
        dataTask.resume()
        
    }
    
}
