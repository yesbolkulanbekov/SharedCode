////
////  BaseService.swift
////  Taskman
////
////  Created by Yesbol Kulanbekov on 2/19/19.
////  Copyright © 2019 zed.kz. All rights reserved.
////
//
//import Foundation
//import Moya
//import Result
//import ObjectMapper
//
//
//let multiProvider = MoyaProvider<MultiTarget>()
//
//protocol BaseService: TargetType {
//    func parseOnMoyaSuccess(_ json: Any)
//    func parseOnMoyaFailure(_ errorJson: Any)
//    func parseOnMoyaFailure(_ moyaError: MoyaError)
//    
//    
//    associatedtype RootObject: BaseMappable
//    associatedtype CustomError: Error
//    var onReturn: (Result<RootObject, CustomError>) -> Void { get set }
//    
//}
//
//extension BaseService {
//    var baseURL: URL {
//        return URL(string:"https://fruitstory.kz")!
//    }
//    
//    var path: String  {
//        return ""
//    }
//    
//    var method: Moya.Method {
//        return .get
//    }
//    
//    var task: Task {
//        return .requestPlain
//    }
//    
//    var headers: [String : String]? {
//        return nil
//    }
//    
//    var validationType: ValidationType {
//        return .successCodes
//    }
//    
//    var sampleData: Data {
//        return "Sample Data".data(using: .utf8)!
//    }
//    
//}
//
//// MARK: Default implementation
//
//extension BaseService {
//    
//    func parseOnMoyaSuccess(_ json: Any) {
//        let rootObject = Mapper<RootObject>().map(JSONObject: json)!
//        let result = Result<RootObject,CustomError>.success(rootObject)
//        self.onReturn(result)
//    }
//    
//    func parseOnMoyaFailure(_ errorJson: Any) {
//        let customError = ErrorRoot.map(errorJson) as! CustomError
//        let result = Result<RootObject,CustomError>.failure(customError)
//        self.onReturn(result)
//    }
//    
//    func parseOnMoyaFailure(_ moyaError: MoyaError) {
//        let moyaError = moyaError as! CustomError
//        let result = Result<RootObject,CustomError>.failure(moyaError)
//        self.onReturn(result)
//    }
//    
//}
//
//// MARK: Helpers
//
//extension BaseService {
//    
//    
//    private func onMoyaRequestCompletion(_ result: Result<Moya.Response, MoyaError>) {
//        debugPrint(result)
//        
//        switch result {
//        case let .success(response):
//            handle(response.data, with: { json in self.parseOnMoyaSuccess(json) } )
//        case let .failure(moyaError):
//            switch (moyaError is CustomError) {
//            case true:
//                parseOnMoyaFailure(moyaError)
//            case false:
//                handle(moyaError.response!.data) { self.parseOnMoyaFailure($0) }
//            }
//        }
//        
//    }
//    
//    private func handle(_ data: Data, with onSerialize: (Any) -> Void) {
//        
//        guard !data.isEmpty else {
//            let emptyJSON = "emptyJSONString"
//            onSerialize(emptyJSON)
//            return
//        }
//        
//        do {
//            let json = try JSONSerialization.jsonObject(with: data, options: [])
//            onSerialize(json)
//        } catch {
//            print("Data can't be parsed into json")
//            return
//        }
//    }
//    
//    
//    func dispatch() {
//        let target = MultiTarget(self)
//        multiProvider.request(target, completion: self.onMoyaRequestCompletion)
//    }
//}
//
//extension BaseService {
//    func debugPrint(_ result: Result<Moya.Response, MoyaError>) {
//        switch result {
//        case let .success(response):
//            let reponseData = String(data: response.data, encoding: String.Encoding.utf8) ?? "Can't be encoded"
//            print("Success with status code: ", response.statusCode)
//            print("Reponse data is: ", reponseData)
//            
//        case let .failure(moyaError):
//            guard let response = moyaError.response else { print("No data"); return }
//            let reponseData = String(data: response.data, encoding: String.Encoding.utf8) ?? "Can't be encoded"
//            print("Reponse data is: ", reponseData)
//            print("Moya error is: ", moyaError.localizedDescription)
//        }
//    }
//}
//
//
//
