//
//  ViewController.swift
//  CollectionAndTableViewMix
//
//  Created by pratik gajbhiye on 24/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , UITableViewDelegate {
   
    
    @IBOutlet weak var tableview: UITableView!
    
    private let models = ["sport1.jpg","sport2.jpg","sport3.jpg","sport4.jpg"]
    
    private let nameLabel : [String] = ["Cricket","FootBall","Swimming","Dance"]
    
    private let tableviewList = ["1","2","3","4"]
    
    class ModelClass {
        var cImage = "sport1.jpg"
        var cName = "Cricket"
        var tData = ["1","2","3","4"]
        var index = 1
       
        
    }
    

    private var collectionView: UICollectionView?
    
    var modelClass : ModelClass = ModelClass()
    
    var viewModel = PerformanceDetailsViewModel()

  override func viewDidLoad() {
        super.viewDidLoad()
        addView()
//        self.circularProgressBarView.value = 0
    tableview.dataSource = viewModel
    tableview.delegate = self

    
        tableview.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.identifier)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
      
    }
    
    func addView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 10, width: self.view.frame.size.width, height: 300), collectionViewLayout: layout)
        collectionView?.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identifier)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = viewModel
        
        guard let myCollectionView = collectionView else {
                  return
              }
              view.addSubview(myCollectionView)
          }
          
          
          
          
          override func viewDidLayoutSubviews() {
              super.viewDidLayoutSubviews()
              collectionView?.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100)
          }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("want to reloading data")
        
    }

          
         
          
          
}



//extension ViewController : UITableViewDataSource , UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        tableviewList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = modelClass.tData[indexPath.row]
//        return cell
//    }
//
//
//}
