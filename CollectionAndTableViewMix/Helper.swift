//
//  Helper.swift
//  CollectionAndTableViewMix
//
//  Created by pratik gajbhiye on 25/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation
public func dataFromFile(_ filename: String) -> Data? {
    @objc class TestClass: NSObject { }
    let bundle = Bundle(for: TestClass.self)
    if let path = bundle.path(forResource: filename, ofType: "json") {
        return (try? Data(contentsOf: URL(fileURLWithPath: path)))
    }
    return nil



}
