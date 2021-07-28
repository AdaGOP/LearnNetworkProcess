//
//  AddLearningViewController.swift
//  RequestAPIData
//
//  Created by zein rezky chandra on 16/07/21.
//  Copyright © 2021 Haryanto Salim. All rights reserved.
//

import UIKit

class AddLearningViewController: UIViewController {

    @IBOutlet weak var actStatusTxt: UITextField!
    @IBOutlet weak var actNameTxt: UITextField!
    @IBOutlet weak var actTypeTxt: UITextField!
    
    private var activityType = ""
    private var activityName = ""
    private var activityStatus = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onClickAddNew(_ sender: UIButton) {
//        print(activityType+activityName+activityStatus)
        let headers = [
            "Authorization" : "Bearer keysD68W93dXWNi8b",
            "Content-Type" : "application/json",
            "Accept" : "application/json"
        ]
        
        APIRequest.addNewLearningActivity(url: Constant.POST_LEARNING, header: headers, type: activityType, status: activityStatus, name: activityName, showLoader: true) { responseData in
            if responseData.records?.count != 0 {
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        } failCompletion: { message in
            print("POST data to server fail with reason: \(message)")
        }
        
    }
    
}

extension AddLearningViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == actTypeTxt {
            actNameTxt.becomeFirstResponder()
        } else if textField == actNameTxt {
            actStatusTxt.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == actTypeTxt {
            activityType = textField.text!
            actNameTxt.becomeFirstResponder()
        } else if textField == actNameTxt {
            activityName = textField.text!
            actStatusTxt.becomeFirstResponder()
        } else {
            activityStatus = textField.text!
            textField.resignFirstResponder()
        }
    }
    
}
