//
//  PerformanceModel.swift
//  newCollectioView
//
//  Created by pratik gajbhiye on 18/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation

class PerformanceModel: Encodable {
    
    var result = [PerformanceList]()
    init?(data: Data) {
            do{
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] ,
                    let body = json["data"] as? [String: Any]
                {
                    if let performancelist = body["result"] as? [[String: Any]]{
                        self.result = performancelist.map{ PerformanceList(json: $0)}
                    }
                }
            }
            catch{
                print("Error deserializing JSON: \(error)")
                return nil
            }
    }
}


class PerformanceList : Encodable {
    var indexlabel : Int?
    var title  : String?
    var hearderImage : String?
    var performance = [PerfomanceDetails]()
    init(json:[String: Any] ){
        self.indexlabel = json["index"] as? Int
        self.title = json["title"] as? String
        self.hearderImage = json["headerImage"] as? String
        if let performanceDetails = json["performance"] as? [[String: Any]]{
            self.performance = performanceDetails.map{
                PerfomanceDetails(json: $0)
            }
        }
    }
    
    
    
}

class PerfomanceDetails : Encodable {
    var sessionStartDate: String?
    var endDate: String?
    var academyName: String?
    var category: String?
    var circularBarRating: Float?
    var linearBarRating: Float?
    var level: String?
    var totalNoOfSession: String?
    var sessionAttended: String?

    init(json: [String: Any]){
        self.sessionStartDate = json["sessionStartDate"] as? String
        self.endDate = json["endDate"] as? String
        self.academyName = json["academyName"] as? String
        self.category = json["category"] as? String
        self.circularBarRating = json["circularBarRating"] as? Float
        self.linearBarRating = json["linearBarRating"] as? Float
        self.level = json["level"] as? String
        self.totalNoOfSession = json["totalNoOfSession"] as? String
        self.sessionAttended = json["sessionAttended"] as? String
    }
    
}
























