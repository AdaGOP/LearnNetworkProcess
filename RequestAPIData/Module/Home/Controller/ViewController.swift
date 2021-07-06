//
//  ViewController.swift
//  RequestAPIData
//
//  Created by Haryanto Salim on 11/07/20.
//  Copyright © 2020 Haryanto Salim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countryTable: UITableView!
    
    var countryData: [String] = []
    
    let cellID = "CountryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countryTable.delegate = self
        countryTable.dataSource = self
        
//        loadCountryDataFromAPI()
        loadQuarantineCountry()

    }

    func loadCountryDataFromAPI(){
        
        //prepare custom header
        let headers = [
            "x-rapidapi-host": "covid-193.p.rapidapi.com",
            "x-rapidapi-key": "866f0006a2msh5b7e6d519a7d701p1e2323jsn173d9ad99dab"
        ]
        
        APIRequest.fetchCountry(url: Constant.COUNTRY_LIST, header: headers, showLoader: true) { response in
            for item in response {
                self.countryData.append(item.countryName ?? "")
            }
            DispatchQueue.main.async {
                self.countryTable.reloadData()
            }
            // dismiss loader
        } failCompletion: { message in
            // display alert failure
            // dismiss loader
            print(message)
        }
    }
    
    func loadQuarantineCountry(){

        let headers = [
            "application/json": "Accept"
        ]
        
        APIRequest.fetchQuarantineCountry(url: Constant.QUARANTINE_COUNTRY, header: headers, showLoader: true) { response in
            print(response)
        } failCompletion: { message in
            // display alert failure
            // dismiss loader
            print(message)
        }

    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryTable.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = countryData[indexPath.row]
        
        return cell
    }
}
