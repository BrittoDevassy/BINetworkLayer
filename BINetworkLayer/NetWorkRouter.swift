//
//  NetWorkRouter.swift
//  BINetworkLayer
//
//  Created by Britto on 4/29/18.
//  Copyright © 2018 Britto. All rights reserved.
//

import Foundation

public typealias NetworkCompletion = (_ data: Data?,_ error: Error?)->()

enum NetworkError:Error {
    case genericError
    case authenticationError
    case badRequest
    case outdated
}

class NetWorkRouter {
    
    func request(_ route: ApiRequest, completion: @escaping NetworkCompletion) {
        // Here we are making the actual request
        // we can use NSURLSession or any other thrid part library like Alamofire
        
        
        
    }
    
    
    private func validateResponse(response: HTTPURLResponse)throws {
        switch response.statusCode {
        case 200...299: () // success
        case 401...500: throw NetworkError.authenticationError
        case 501...599: throw NetworkError.badRequest
        case 600: throw NetworkError.outdated
        default: throw NetworkError.genericError
        }

        
    }
    
    
    enum HttpResponseError:Error {
        case here
    }
}

