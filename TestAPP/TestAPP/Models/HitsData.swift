/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct HitsData : Mappable {
	var hits : [Hits]?
	var nbHits : Int?
	var page : Int?
	var nbPages : Int?
	var hitsPerPage : Int?
	var exhaustiveNbHits : Bool?
	var query : String?
	var params : String?
	var processingTimeMS : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		hits <- map["hits"]
		nbHits <- map["nbHits"]
		page <- map["page"]
		nbPages <- map["nbPages"]
		hitsPerPage <- map["hitsPerPage"]
		exhaustiveNbHits <- map["exhaustiveNbHits"]
		query <- map["query"]
		params <- map["params"]
		processingTimeMS <- map["processingTimeMS"]
	}

}


struct Hits : Mappable {
    var created_at : String?
    var title : String?
    var url : String?
    var author : String?
    var points : Int?
    var story_text : String?
    var comment_text : String?
    var num_comments : Int?
    var story_id : String?
    var story_title : String?
    var story_url : String?
    var parent_id : String?
    var created_at_i : Int?
    var _tags : [String]?
    var objectID : String?
    var _highlightResult : _highlightResult?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        created_at <- map["created_at"]
        title <- map["title"]
        url <- map["url"]
        author <- map["author"]
        points <- map["points"]
        story_text <- map["story_text"]
        comment_text <- map["comment_text"]
        num_comments <- map["num_comments"]
        story_id <- map["story_id"]
        story_title <- map["story_title"]
        story_url <- map["story_url"]
        parent_id <- map["parent_id"]
        created_at_i <- map["created_at_i"]
        _tags <- map["_tags"]
        objectID <- map["objectID"]
        _highlightResult <- map["_highlightResult"]
    }

}

struct Url : Mappable {
    var value : String?
    var matchLevel : String?
    var matchedWords : [String]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        value <- map["value"]
        matchLevel <- map["matchLevel"]
        matchedWords <- map["matchedWords"]
    }

}


struct Title : Mappable {
    var value : String?
    var matchLevel : String?
    var matchedWords : [String]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        value <- map["value"]
        matchLevel <- map["matchLevel"]
        matchedWords <- map["matchedWords"]
    }

}

struct Author : Mappable {
    var value : String?
    var matchLevel : String?
    var matchedWords : [String]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        value <- map["value"]
        matchLevel <- map["matchLevel"]
        matchedWords <- map["matchedWords"]
    }

}

struct _highlightResult : Mappable {
    var title : Title?
    var url : Url?
    var author : Author?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        title <- map["title"]
        url <- map["url"]
        author <- map["author"]
    }

}
