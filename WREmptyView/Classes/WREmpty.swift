//
//  WREmpty.swift
//  Pods
//
//  Created by 项辉 on 2020/3/26.
//

import UIKit
import Foundation

//MARK:-  WREmptyable
public protocol WREmptyable {
    var numberOfSections: Int { get }
    func numberOfRows(inSection section: Int) -> Int
}

extension UITableView: WREmptyable {
    
}
extension UICollectionView: WREmptyable {
    public func numberOfRows(inSection section: Int) -> Int {
        return numberOfItems(inSection: section)
    }
}


//MARK:-  WREmpty
public protocol WREmpty: WREmptyable {
    var emptyView: WREmptyView { get set }
}

extension WREmpty {
    var totalCount: Int {
        var count: Int = 0
        for section in 0..<numberOfSections {
            count += numberOfRows(inSection: section)
        }
        return count
    }
    
}

//MARK:-  WREmptyView
open class WREmptyView: UIView {
    open var titleLabel: UILabel?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initDefault()
        initUI()
}
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initDefault()
        initUI()
    }
    
    func initDefault() {
        backgroundColor = .red
    }
    
    func initUI() {
        self.titleLabel = UILabel()
        addSubview(self.titleLabel!)
        
        titleLabel!.text = "无数据"
        titleLabel!.font = UIFont.systemFont(ofSize: 18)
        titleLabel!.textColor = .black
        titleLabel!.frame = self.bounds
        titleLabel!.textAlignment = .center
        titleLabel!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
        
    override open func willMove(toSuperview newSuperview: UIView?) {
        guard let superView = newSuperview else {
             return
         }
        
        frame = CGRect(x: 0, y: 0, width: superView.bounds.width, height: superView.bounds.height)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
}
