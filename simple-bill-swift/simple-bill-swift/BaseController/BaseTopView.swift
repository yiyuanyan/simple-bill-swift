//
//  BaseTopView.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2018/12/22.
//  Copyright © 2018 何建新. All rights reserved.
//

import UIKit

class BaseTopView: UIView {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame);
        initTopViewUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initTopViewUI() {
        self.backgroundColor = UICOLOR_FROM_HEX(hex: 0xf8db61);
    }
    
}
