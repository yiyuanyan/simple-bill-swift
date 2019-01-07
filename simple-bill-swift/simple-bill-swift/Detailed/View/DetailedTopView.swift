//
//  DetailedTopView.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2019/1/7.
//  Copyright © 2019 何建新. All rights reserved.
//

import UIKit

class DetailedTopView: UIView {
    let yearLabel = UILabel();
    let monthLabel = UILabel();
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame);
        initDetailedTopView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func initDetailedTopView(){
        
        self.yearLabel.font = Font(x: 12)
        self.yearLabel.textColor = UICOLOR_FROM_HEX(hex: 0x000000)
        
        self.addSubview(self.yearLabel);
        self.yearLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-LineY(l: 51))
            make.left.equalTo(self.snp.left).offset(LineX(l: 23))
        }
        self.monthLabel.font = Font(x: 12);
        self.monthLabel.textColor = UICOLOR_FROM_HEX(hex: 0x000000);
        self.addSubview(self.monthLabel);
        self.monthLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.yearLabel.snp.left).offset(0);
            make.bottom.equalTo(self.snp.bottom).offset(-LineX(l: 13))
        }
        
    }
    
    func stringAttribute(str:String, rangeString:String, font:UIFont) -> NSMutableAttributedString {
        let attribut = NSMutableAttributedString.init(string: str)
        let pointRange = NSMakeRange(0, str.count-1)
        let dic = NSMutableDictionary()
        dic[NSAttributedString.Key.font] = font
        attribut.addAttributes(dic as! [NSAttributedString.Key : Any], range: pointRange)
        return attribut;
    }
    func setValuesForInfo(dic:NSMutableDictionary){
        self.yearLabel.text = (dic["year"]! as! String);
        let month = dic["month"];
        self.monthLabel.attributedText = stringAttribute(str: month as! String, rangeString: "月", font: Font(x: 20))
    }
    
}
