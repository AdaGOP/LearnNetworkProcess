//
//  APIRequest.swift
//  RequestAPIData
//
//  Created by zein rezky chandra on 06/07/21.
//  Copyright © 2021 Haryanto Salim. All rights reserved.
//

import Foundation
import UIKit

class APIRequest: NSObject {
    
    static func fetchLearningData(url: String,
                                  header: [String: String],
                                  showLoader: Bool,
                                  successCompletion: @escaping (LearningData) -> Void,
                                  failCompletion: @escaping (String) -> Void) {
        BaseRequest.GET(url: url, header: header, showLoader: showLoader) { response in
            print(response)
            var dataModel = DataManager.LEARNINGDATA
            
            do {
                let quarantineModel = try JSONDecoder().decode(LearningData.self, from: response as! Data)
                dataModel = quarantineModel
                successCompletion(dataModel!)       
            } catch let error {
                print("error reading json file content: \(error.localizedDescription)")
            }
        }
    }
    
    static func addNewLearningActivity(url: String,
                                       header: [String: String],
                                       type: String,
                                       status: String,
                                       name: String,
                                       showLoader: Bool,
                                       successCompletion: @escaping (LearningData) -> Void,
                                       failCompletion: @escaping (String) -> Void) {
        BaseRequest.POST(url: url, header: header, type: type, status: status, name: name, showLoader: showLoader) { response in
            
            var dataModel = DataManager.LEARNINGDATA
            
            do {
               let newActivityData = try JSONDecoder().decode(LearningData.self, from: response as! Data)
                dataModel = newActivityData
                successCompletion(dataModel!)
            } catch let error {
                print("Error reading json file with content: \(error.localizedDescription)")
            }
        } failCompletion: { message in
            print("Error: \(message)")
        }

    }

}
