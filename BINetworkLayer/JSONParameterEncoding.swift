//
//  JSONParameterEncoding.swift
//  BINetworkLayer
//
//  Created by Britto on 4/29/18.
//  Copyright © 2018 Britto. All rights reserved.
//

import Foundation
public struct JSONParameterEncoder: ParameterEncoder {
    public func encode(urlRequest: inout URLRequest, with parameters: ApiParameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }catch {
            throw URLEncodingError.encodingFailed
        }
    }
}
