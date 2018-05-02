//
//  NetWorkRouter.swift
//  BINetworkLayer
//
//  Created by Britto on 4/29/18.
//  Copyright © 2018 Britto. All rights reserved.
//

import Foundation

public typealias NetworkCompletion = (_ data: Data?,_ error: Error?)->()


class NetWorkRouter {
    
    func request(_ route: ApiRequest, completion: @escaping NetworkCompletion) {
        
        
    }
    
    func validateResponse(response: HTTPURLResponse)throws {
        
    }
    
    
    enum HttpResponseError:Error {
        case here
    }
}

