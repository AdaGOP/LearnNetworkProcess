//
//  BaseRequest.swift
//  RequestAPIData
//
//  Created by zein rezky chandra on 06/07/21.
//  Copyright © 2021 Haryanto Salim. All rights reserved.
//

import Foundation

class BaseRequest: NSObject {

    static func GET(url: String,
                    header: [String: String],
                    showLoader: Bool,
                    completionHandler: @escaping (Any) -> Void) {
        if showLoader {
            // display loader
        }
        //init request
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        //configure request method dan set header
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header

        //init session
        let session = URLSession.shared

        //init datatask dengan
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                if let dataFromAPI = data {
                    completionHandler(dataFromAPI)
                }
            }
        })

        dataTask.resume()
    }
    
    static func POST(url: String,
                     header: [String: String],
                     parameters: [String: Any],
                     showLoader: Bool,
                     completionHandler: @escaping (Any) -> Void) {
        if showLoader {
            // display loader
        }
        //init request
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        //configure request method dan set header
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)

        request.httpMethod = "POST"
        request.allHTTPHeaderFields = header
        request.httpBody = jsonData

        //init session
        let session = URLSession.shared

        //init datatask dengan
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                if let dataFromAPI = data {
                    completionHandler(dataFromAPI)
                }
            }
        })

        dataTask.resume()
    }
    
}