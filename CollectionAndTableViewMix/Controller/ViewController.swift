//
//  ViewController.swift
//  CollectionAndTableViewMix
//
//  Created by pratik gajbhiye on 24/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , UITableViewDelegate {
    
    //tableVIew
    @IBOutlet weak var tableview: UITableView!
    
    //CollectionView
    private var collectionView: UICollectionView?
    
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
    
    
    /*
     here i want to reload the tableview data as per the collection view cell selelcted ,
     the collection view will act as top menu bar , and all data which is in tableview and collection will be dynamic
     As soon as user select any cell from top (from collection view) tableview will change the value
     */
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("want to reloading data")
        tableview.reloadData()
        
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
