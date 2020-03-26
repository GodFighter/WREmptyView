//
//  UITableView+WREmpty.swift
//  Pods
//
//  Created by 项辉 on 2020/3/26.
//

import UIKit
import WRRuntime

extension UITableView: WRRuntimeProtocol {
    
    public static var wr_swizzleMethods = [(#selector(reloadData), #selector(wr_reloadData))]
    
    @objc public dynamic func wr_reloadData() {
        print("123456")
    }
    
}
