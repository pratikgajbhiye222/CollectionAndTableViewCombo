//
//  CollectionViewCell.swift
//  CollectionAndTableViewMix
//
//  Created by pratik gajbhiye on 24/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation

import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    static let identifier = "Cell101"
    
    private let myImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode  = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.backgroundColor = .blue
        
        imageView.layer.cornerRadius = 60.0 / 2
        
//        imageView.layer.borderWidth = 2
//        imageView.layer.borderColor = UIColor.link.cgColor
        return imageView
           }()
    var nameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        
//     label = UILabel(frame: CGRect(x:0 , y: 0, width: UIScreen.main.bounds.width , height: 20))
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.9

        return label
    }()
    
    lazy var verticalStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [self.myImageView, self.nameLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 1.0
        return stackView
    }()

        
        
        
           
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.addSubview(myImageView)
//        contentView.addSubview(nameLabel)
//        myImageView.frame = contentView.bounds
//        nameLabel.frame = contentView.bounds
//        nameLabel.topAnchor.constraint(equalTo: myImageView, constant: 0) = true
        handleConstraints()
        
    }
    
    
    var item: PerformanceList? {
           didSet{
               guard let item = item  else {
                   return
               }
            nameLabel.text = item.title ?? ""
            myImageView.imageURL = item.hearderImage ?? ""
            
        }
        
        }
    func handleConstraints() {

        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(verticalStackView)

        verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        verticalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        myImageView.frame = contentView.bounds
//        nameLabel.frame = contentView.bounds
        handleConstraints()
    }
    
    public func configure (with name: String){
        myImageView.imageURL = name
        
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
        nameLabel.text = nil
    }
}
