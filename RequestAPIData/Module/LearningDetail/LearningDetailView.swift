//
//  LearningDetailView.swift
//  RequestAPIData
//
//  Created by khoirunnisa' rizky noor fatimah on 20/08/21.
//  Copyright © 2021 Haryanto Salim. All rights reserved.
//

import SwiftUI

class DetailEnvironmentObject: ObservableObject {
    @Published var activityName = ""
    @Published var activityStatus = ""
    @Published var activityType = ""
    
    init(activityName: String, activityStatus: String, activityType: String) {
        self.activityName = activityName
        self.activityStatus = activityStatus
        self.activityType = activityType
    }
}

struct LearningDetailView: View {
    
    @EnvironmentObject var detailEnvironmentObject : DetailEnvironmentObject
    
    var body: some View {
        VStack {
            Text("Activity name: \(detailEnvironmentObject.activityName)")
            Text("Activity status: \(detailEnvironmentObject.activityStatus)")
            Text("Activity type: \(detailEnvironmentObject.activityType)")
        }
        
    }
}

struct LearningDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LearningDetailView()
    }
}
