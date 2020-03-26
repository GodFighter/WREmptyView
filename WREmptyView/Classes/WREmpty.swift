//
//  WREmpty.swift
//  Pods
//
//  Created by 项辉 on 2020/3/26.
//

import UIKit
import Foundation

public protocol WREmpty {
    var emptyView: WREmptyView { get set }
}



open class WREmptyView: UIView {
//    open var titleLabel: UILabel
    
    public override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initDefault() {
        self.backgroundColor = .red
    }
}
