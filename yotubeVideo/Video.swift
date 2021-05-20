import Foundation

struct Video:  Decodable {
var videoID = ""
var title = ""
var description = ""
var thumbnail = ""
var published = Date()

enum CodingKeys: String ,CodingKey {
    
    //you have a case for each key
    case snippet
    case published = "publishedAt"
    case title
    case description
    case thumbnail = "url"
    case videoID
    case high
    case resourceId
}
    init( from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parce the title
        self.title =  try snippetContainer.decode(String.self, forKey: .title)
        
        //parce the description
        self.description =  try snippetContainer.decode(String.self, forKey: .description)
        
        //parce the publish date
        self.published =  try snippetContainer.decode(Date.self, forKey: .published)
        
        //parce the the thumnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnail)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //parce the video id
        let resourceIDContainer = try
            snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoID = try resourceIDContainer.decode(String.self, forKey: .videoID)
        
    }
    
    
    
}
