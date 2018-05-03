//
//  RequestDataViewController.swift
//  SwiftDemo
//
//  Created by zws on 2018/1/30.
//  Copyright © 2018年 MAF. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya
import MJRefresh

class RequestDataViewController: BaseViewController_BAKit {
    
    let viewModel = HomeViewModel()
    var tableView = UITableView()
    var bag:DisposeBag = DisposeBag()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "话题"
        
        setupUI()
        
        tableViewAction()
    }

    
    func setupUI (){
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: LLSCREENW, height: LLSCREENH - CGFloat(NAVMargin)), style: UITableViewStyle.plain)
        
        tableView.register(UINib.init(nibName: "LLHomeCell", bundle: nil), forCellReuseIdentifier: cellID)
        
        tableView.rowHeight = 80
        
        tableView.tableFooterView = UIView.init()
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior(rawValue: 2)!
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        };
        
        view.addSubview(tableView)
        
        viewModel.tableV = tableView
        
        viewModel.SetConfig()
        
        weak var weakself = self
        
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            weakself?.viewModel.requestNewDataCommond.onNext(true)
        })
        
        tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            weakself?.viewModel.requestNewDataCommond.onNext(false)
        })
        
        tableView.mj_header.beginRefreshing()
    }
    
    func tableViewAction(){
        tableView.rx.itemSelected.subscribe(onNext: {
            (index : IndexPath) in
        })
        .disposed(by: bag)
        
        tableView.rx.modelSelected(StoryModel.self).subscribe(onNext:{(model:StoryModel) in
            let idString = String(format: "%d", model.id!)
            let storyDetailVC = StoryDetailViewController(storyId: idString)
            self.navigationController?.pushViewController(storyDetailVC, animated: true)
        })
        .disposed(by: bag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
