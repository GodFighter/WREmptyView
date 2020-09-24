//
//  UITableView+WREmpty.swift
//  Pods
//
//  Created by 项辉 on 2020/3/26.
//

import UIKit
import WRRuntime

let WR_EmptyView_Key = UnsafeRawPointer.init(bitPattern: "kEmptyViewKey".hashValue)

extension UITableView: WRRuntimeProtocol, WREmpty {
        
    public var emptyView: WREmptyView {
        get {
            var emptyView: WREmptyView? = objc_getAssociatedObject(self, WR_EmptyView_Key!) as? WREmptyView
            
            guard emptyView != nil else {
                emptyView = WREmptyView()
                self.addSubview(emptyView!)
                objc_setAssociatedObject(self, WR_EmptyView_Key!, emptyView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                self.bringSubviewToFront(emptyView!)
                return emptyView!
            }
            
            self.bringSubviewToFront(emptyView!)
            return emptyView!
        }
        set {
            if newValue == self.emptyView {
                return
            }
            self.emptyView.removeFromSuperview()
            self.addSubview(newValue)
            objc_setAssociatedObject(self, WR_EmptyView_Key!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    public static var wr_swizzleMethods = [(#selector(reloadData), #selector(_wr_reloadData))]
    
    @objc private dynamic func _wr_reloadData() {
        _wr_reloadData()
        
        self.separatorStyle = .none
        checkCount()
    }
    
    private func checkCount() {
        guard emptyView.displayEnable else {
            return
        }
        self.emptyView.isHidden = totalCount != 0
    }
        
}
