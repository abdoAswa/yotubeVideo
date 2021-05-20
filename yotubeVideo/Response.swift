
import Foundation

struct Response: Decodable
{
    
    
    var items: [Video]?
    
    enum CodinKeys: String,CodingKey {
        
        
        case items
        
    }
    
    
    
    
    init( from decoder: Decoder)throws  {
        
        let container = try decoder.container(keyedBy: CodinKeys.self)
        
        self.items = try container.decode([Video].self, forKey:.items)
    }
    
}

