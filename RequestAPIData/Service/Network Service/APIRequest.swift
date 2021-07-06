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
    
    static func fetchCountry(url: String,
                             header: [String: String],
                             showLoader: Bool,
                             successCompletion: @escaping ([CountryModel]) -> Void,
                             failCompletion: @escaping (String) -> Void) {
        BaseRequest.GET(url: url, header: header, showLoader: showLoader) { response in

            var dataModel = DataManager.COUNTRY

            do {
                let json = try JSONSerialization.jsonObject(with: (response as? Data)!, options: .mutableContainers) as! [String: AnyObject]
                
                for item in json["response"] as! NSArray{
                    dataModel.append(CountryModel(countryName: (item as! String)))
                }
                successCompletion(dataModel)
            } catch let error {
                failCompletion(error.localizedDescription)
            }
        }
    }
    
    static func fetchQuarantineCountry(url: String,
                                       header: [String: String],
                                       showLoader: Bool,
                                       successCompletion: @escaping (Quarantine) -> Void,
                                       failCompletion: @escaping (String) -> Void) {
        BaseRequest.GET(url: url, header: header, showLoader: showLoader) { response in
            var dataModel = DataManager.QURANTINEDATA
            
            do {
                let quarantineModel = try JSONDecoder().decode(Quarantine.self, from: response as! Data)
                dataModel = quarantineModel
                successCompletion(dataModel!)               
            } catch let error {
                print("error reading json file content: \(error.localizedDescription)")
            }
            
            
        }
    }
    
}