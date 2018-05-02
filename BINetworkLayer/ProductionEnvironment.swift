//
//  ProductionEnvironment.swift
//  BINetworkLayer
//
//  Created by Britto on 4/30/18.
//  Copyright © 2018 Britto. All rights reserved.
//

import Foundation

struct ProductionEnvironment {
    static var globalEnvironmentType: ProductionEnvironmentType = .qa
    static  var globalEnvironment: ProductionEnvironment  = {
        let productionEnvironment = ProductionEnvironment(globalEnvironmentType.rawValue, host: globalEnvironmentType.host)
        return productionEnvironment
    }()
    
    /// Name of the environment
    public var name: String
    
    /// Base URL of the environment
    public var host: String
    
    /// This is the list of common headers which will be part of each Request
    /// Some headers value maybe overwritten by Request's own headers
    public var headers: [String: String] = [:]
    
    /// Cache policy
    public var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    
    /// Initialize a new Environment
    ///
    /// - Parameters:
    ///   - name: name of the environment
    ///   - host: base url
    public init(_ name: String, host: String) {
        self.name = name
        self.host = host
    }
}

enum ProductionEnvironmentType: String {
    case qa = "Qa"
    case staging = "Staging"
    case live = "Live"
    
    var host: String {
        switch self {
        case .qa:
            return "http://example.com"
        default:
            return "http://example.com"
            
        }
    }
    
}
