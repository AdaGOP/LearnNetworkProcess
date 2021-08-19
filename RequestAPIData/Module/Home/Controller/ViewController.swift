//
//  ViewController.swift
//  RequestAPIData
//
//  Created by Haryanto Salim on 11/07/20.
//  Copyright © 2020 Haryanto Salim. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var countryTable: UITableView!
    
    var countryData: [String] = []
    
    let cellID = "CountryCell"
    var learningModel: LearningData?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadLearningData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadLearningData(){

        let headers = [
            "Authorization": "Bearer keysD68W93dXWNi8b"
        ]
        
        APIRequest.fetchLearningData(url: Constant.GET_LEARNING_LIST, header: headers, showLoader: true) { response in
            print(response)
            self.learningModel = response
            DispatchQueue.main.async {
                self.countryTable.reloadData()
            }
        } failCompletion: { message in
            // display alert failure
            // dismiss loader
            print(message)
        }
    }
    
    @IBAction func addNewLearning(_ sender: UIBarButtonItem) {
        
    }
    
    
    func presentLearningDetail(activityName: String, activityType: String, activityStatus: String) {
        let testData = DetailEnvironmentObject(activityName: activityName, activityStatus: activityStatus, activityType: activityType)
        let learningDetailView = LearningDetailView()
        let hostingController = UIHostingController(rootView: learningDetailView.environmentObject(testData))
        self.navigationController?.pushViewController(hostingController, animated: true)
//        present(hostingController, animated: true, completion: nil)
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return learningModel?.records?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryTable.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = learningModel?.records?[indexPath.row].fields?.Namee
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentLearningDetail(activityName: learningModel?.records?[indexPath.row].fields?.Namee ?? "", activityType: learningModel?.records?[indexPath.row].fields?.type ?? "", activityStatus: learningModel?.records?[indexPath.row].fields?.Status ?? "")
        
    }
}
