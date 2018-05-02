//
//  ApiRequest.swift
//  BINetworkLayer
//
//  Created by Britto on 4/29/18.
//  Copyright © 2018 Britto. All rights reserved.
//

import Foundation

protocol ApiRequest {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: ApiParameters? { get set }
    var headers: HTTPHeaders? { get }
    var urlRequest: URLRequest { get }
    var parameterEncodingType: ParameterEncoding{ get }
    var timeOutInterval: Double {get set}
    var environment: ProductionEnvironment{ get set }
    init(environment: ProductionEnvironment)
    init()
    
}

extension ApiRequest {
    
    init(environment: ProductionEnvironment){
        self.init()
        self.environment = environment
    }
    
    var baseURL: URL {
        guard let url = URL(string: environment.host) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    func urlRequest() throws -> URLRequest {
        
        var request = URLRequest(url: baseURL.appendingPathComponent(path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: timeOutInterval)
        request.httpMethod = httpMethod.rawValue
        
        try configureParameters(bodyParameters: parameters, bodyEncoding: parameterEncodingType, urlParameters: parameters, request: &request)
        
        addAdditionalHeaders(environment.headers, request: &request)
        addAdditionalHeaders(headers, request: &request)
        
        return request
    }
    
    
    
    private func configureParameters(bodyParameters: ApiParameters?,
                                     bodyEncoding: ParameterEncoding,
                                     urlParameters: ApiParameters?,
                                     request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    bodyParameters: bodyParameters, urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    
    private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
}

public enum HTTPMethod : String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}


public typealias HTTPHeaders = [String:String]
public typealias ApiParameters = [String:Any]
