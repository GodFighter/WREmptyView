//
//  UITableView+WREmpty.swift
//  Pods
//
//  Created by 项辉 on 2020/3/26.
//

import UIKit
import WRRuntime

extension UITableView: WRRuntimeProtocol, WREmpty {    
    public var emptyView: WREmptyView {
        get {
            var emptyView: WREmptyView? = objc_getAssociatedObject(self, "WR_TableView_EmptyView") as? WREmptyView
            
            guard emptyView != nil else {
                emptyView = WREmptyView()
                objc_setAssociatedObject(self, "WR_TableView_EmptyView", emptyView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return emptyView!
            }
            
            return emptyView!
        }
        set {
            if newValue == self.emptyView {
                return
            }
            objc_setAssociatedObject(self, "WR_TableView_EmptyView", newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    public static var wr_swizzleMethods = [(#selector(reloadData), #selector(wr_reloadData))]
    
    @objc private dynamic func wr_reloadData() {
        wr_reloadData()
        
        print("123456")
    }
    
}
