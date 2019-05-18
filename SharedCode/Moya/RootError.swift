//
//  RootError.swift
//  Taskman
//
//  Created by Yesbol Kulanbekov on 3/22/19.
//  Copyright © 2019 zed.kz. All rights reserved.
//
//
//import ObjectMapper
//
//struct ErrorRoot {
//    var message: String!
//    var code: String!
//    
//    static func map(_ json: Any) -> ServerError {
//        
//        guard let rootError = Mapper<ErrorRoot>().map(JSONObject: json) else {
//            return ServerError.objectMapperFailure("RootError's object mapping failure")
//        }
//        
//        return ServerError.serverMessage(rootError.message ?? "No message")
//    }
//    
//}
//
//extension ErrorRoot: Mappable {
//    init?(map: Map) {
//        
//    }
//    
//    mutating func mapping(map: Map) {
//        message <- map["message"]
//        code    <- map["code"]
//    }
//    
//}
//
//
