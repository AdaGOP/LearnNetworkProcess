//
//  LearningDetailView.swift
//  RequestAPIData
//
//  Created by khoirunnisa' rizky noor fatimah on 17/08/21.
//  Copyright © 2021 Haryanto Salim. All rights reserved.
//

import SwiftUI

class DetailEnvironmentObject: ObservableObject {
    @Published var activityName = ""
    @Published var activityType = ""
    @Published var activityStatus = ""
    
    init (activityName: String, activityStatus: String, activityType: String) {
        self.activityName = activityName
        self.activityType = activityType
        self.activityStatus = activityStatus
    }
}

struct LearningDetailView: View {
    
    @EnvironmentObject var detailEnvironmentObject: DetailEnvironmentObject
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Activity Name :")
            Text(detailEnvironmentObject.activityName)
                .font(.system(size: 20))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .bold()
                .aspectRatio(contentMode: .fill)
            Spacer()
                .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("Activity Type :")
            Text(detailEnvironmentObject.activityType)
                .foregroundColor(.blue)
                .font(.system(size: 20))
                .bold()
            
            Spacer()
                .frame(width: 10, height: 10, alignment: .center)
            
            Text("Activity Status :")
            Text(detailEnvironmentObject.activityStatus)
                .font(.system(size: 20))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .bold()
            
            Spacer()
                .frame(width: 100, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }
        
        
    }
    
}

struct LearningDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LearningDetailView()
    }
}
