//
//  Singleton.swift
//  SingletonPro
//
//  Created by trung on 2018/08/21.
//  Copyright © 2018 trung. All rights reserved.
//

import Foundation
class Singleton {
    static let shared = Singleton ()
    private var arrayPrivate: [Int]?
  
    var index = 0
    
    
    var array: [Int] {
        get {
            if arrayPrivate == nil {
                mang()
            }
            return arrayPrivate ?? []
        }
        set {
            arrayPrivate = newValue
            }
    }
    func mang()  {
        arrayPrivate = []
        arrayPrivate = [Int](5...10)
    }
    func appen(number: Int) {
        arrayPrivate?.append(number)
    }
    func editData(number: Int) {
        arrayPrivate?[index] = number
    }
    func remove(at indexPath: IndexPath) {
        arrayPrivate?.remove(at: indexPath.row)
    }
    
    
}
