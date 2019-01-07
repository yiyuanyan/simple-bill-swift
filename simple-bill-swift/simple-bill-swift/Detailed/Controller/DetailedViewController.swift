//
//  DetailedViewController.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2018/12/22.
//  Copyright © 2018 何建新. All rights reserved.
//
//详情
import UIKit

class DetailedViewController: BaseViewController {
    let detailedTopView = DetailedTopView();
    override func viewDidLoad() {
        super.viewDidLoad()
        initDetailedTopView();
       
        //self.detailedTopView.yearLabel.text = "2018年";
        //self.topView.monthLabel.text = "12月";
        
        // Do any additional setup after loading the view.
    }
    
    func initDetailedTopView() {
        self.view.addSubview(self.detailedTopView)
//        self.detailedTopView.yearLabel.text = "2018年";
//        self.detailedTopView.monthLabel.text = "12月";
        self.detailedTopView.snp.makeConstraints { (make) in
            make.top.right.left.bottom.equalTo(self.topView).offset(0);
        }
        let dic = NSMutableDictionary.init();
        dic["year"] = "2018年";
        dic["month"] = "12月";
        self.detailedTopView.setValuesForInfo(dic: dic);
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
