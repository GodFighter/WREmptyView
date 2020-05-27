//
//  UICollectionView+WREmpty.swift
//  Pods-WREmptyView_Example
//
//  Created by 项辉 on 2020/5/22.
//

import UIKit
import WRRuntime

extension UICollectionView: WRRuntimeProtocol, WREmpty {

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
        
        checkCount()
    }
    
    private func checkCount() {
        self.emptyView.isHidden = totalCount != 0
    }

}
