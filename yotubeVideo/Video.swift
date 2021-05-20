//
//  Video.swift
//  yotubeVideo
//
//  Created by abdelrahman aswa ahmed  on 20/05/2021.
//  Copyright © 2021 abdelrahman aswa ahmed . All rights reserved.
//

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
