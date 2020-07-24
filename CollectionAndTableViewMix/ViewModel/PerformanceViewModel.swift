//
//  PerformanceViewModel.swift
//  newCollectioView
//
//  Created by pratik gajbhiye on 18/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation
import UIKit
enum PerformaceDetailsViewModelType{
    case performanceList
}

enum TVPerformaceDetailsViewModelType{
    case performaceDetails
}

protocol TVPerformanceDetailsViewModelItems {
    var type: TVPerformaceDetailsViewModelType { get }
    var rowCount: Int { get }
}

extension TVPerformanceDetailsViewModelItems {
    var rowCount: Int {
        return 1
    }
}



protocol PerformanceDetailsViewModelItems {
    var type: PerformaceDetailsViewModelType { get }
    var rowCount: Int { get }
}

extension PerformanceDetailsViewModelItems {
    var rowCount: Int {
        return 1
    }
}

class PerformanceDetailsViewModelCollectionCellItem: PerformanceDetailsViewModelItems {
    var type: PerformaceDetailsViewModelType{
        return .performanceList
    }
    var rowCount: Int {
        return performanceDetailsList.count
    }
    var performanceDetailsList: [PerformanceList]
    init(performanceDetailsList: [PerformanceList]) {
        self.performanceDetailsList = performanceDetailsList
    }
}

class PerformanceViewModelTableViewDetails: TVPerformanceDetailsViewModelItems {
    var type: TVPerformaceDetailsViewModelType{
        return .performaceDetails
    }
    var rowCount: Int {
        return performanceTBdetails.count
    }
    var performanceTBdetails: [PerfomanceDetails]
    init(performanceTBdetails: [PerfomanceDetails]) {
        self.performanceTBdetails = performanceTBdetails
    }
    
}

class PerformanceDetailsViewModel : NSObject{
    var items = [PerformanceDetailsViewModelItems]()
    var tableItems = [TVPerformanceDetailsViewModelItems]()
    //MARK: - Initilization
    override init() {
        super.init()
        guard let data = dataFromFile("PerformanceJ"),
            let performanceDetailslist = PerformanceModel(data: data) else {
                return
        }
        
         let perfoamance =  performanceDetailslist.result
    
        if !perfoamance.isEmpty {
            let performaceListItem = PerformanceDetailsViewModelCollectionCellItem(performanceDetailsList : perfoamance)
            items.append(performaceListItem)
        }
        
        let tableCellDetails = performanceDetailslist.result.first!.performance
        if !tableCellDetails.isEmpty {
            let tableCellDetails = PerformanceViewModelTableViewDetails(performanceTBdetails: tableCellDetails)
            tableItems.append(tableCellDetails)
        }
        
    }
}


extension PerformanceDetailsViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.section]
        
        switch item.type {
        case .performanceList:
            if let item = item as? PerformanceDetailsViewModelCollectionCellItem , let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identifier, for: indexPath) as? CircleCollectionViewCell {
                cell.item = item.performanceDetailsList[indexPath.row]
                return cell
            }
            return UICollectionViewCell()
        }
    }
    

}


extension PerformanceDetailsViewModel : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableItems[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let item = tableItems[indexPath.section]
        
        switch item.type {
        case .performaceDetails:
            if let item = item as? PerformanceViewModelTableViewDetails , let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell {
                cell.detailsItem = item.performanceTBdetails[indexPath.row]
                return cell
            }
            return UITableViewCell()
        }
    }
    
    
}





