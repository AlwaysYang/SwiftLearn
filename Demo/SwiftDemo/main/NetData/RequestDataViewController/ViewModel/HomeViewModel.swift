//
//  HomeViewModel.swift
//  SwiftDemo
//
//  Created by zws on 2018/1/30.
//  Copyright © 2018年 MAF. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya
import Alamofire
import MJRefresh
//import Result
import enum Result.Result

let cellID = "LLHomeCellID"

//状态枚举
enum LLRefreshStatus {
    case none
    case beginHeaderRefresh
    case endHeaderRefresh
    case beginFooterRefresh
    case endFooterRefresh
    case noMoreData
}

//获取网络请求管理对象
func defaultAlamofireManager () -> Manager{
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
    
    let policies: [String: ServerTrustPolicy] = [
        "ap.grtstar.cn": .disableEvaluation
    ]
    let manager = Alamofire.SessionManager(configuration: configuration,serverTrustPolicyManager: ServerTrustPolicyManager(policies: policies))
    
    manager.startRequestsImmediately = false
    return manager
}



class HomeViewModel: NSObject {
    var bag : DisposeBag = DisposeBag()

    //网络请求工具
    let provider = MoyaProvider<APIManager>(endpointClosure: endpointMapping, manager: defaultAlamofireManager(), plugins: [LLRequestPlugin(),netWorkActivityPlugin])
//    let provider = MoyaProvider<APIManager>()
    // 使用Variable，你可以监听数据的变化 <类型>
    var modelObserable = Variable<[StoryModel]> ([])
    var refreshStateObserable = Variable<LLRefreshStatus>(.none)
    let requestNewDataCommond =  PublishSubject<Bool>()
    var pageIndex = Int()
    var tableV = UITableView()
    
    func SetConfig() {
        //MARK: Rx 绑定tableView数据
        modelObserable.asObservable()
            .bind(to: tableV.rx.items(cellIdentifier: cellID, cellType: LLHomeCell.self)){row, model, cell in
                cell.titleLbl.text = model.title
                cell.imageV.kf.setImage(with: URL.init(string: (model.images?.count)! > 0 ? (model.images?.first)! : ""))
                
        }
        .disposed(by: bag)
        
        
        requestNewDataCommond.subscribe { (event: Event<Bool>) in
            //第一页
            if event.element! {
                self.pageIndex = 0
                self.provider.rx.request(.GetHomeList).asObservable()
                    .filterSuccessfulStatusCodes()
                    .mapJSON()
                    .mapObject(type: HomeModel.self).subscribe(onNext: { (model) in
                        self.modelObserable.value = model.stories!
                        self.refreshStateObserable.value = .endHeaderRefresh
                        
                    }, onError: { (error) in
                        self.refreshStateObserable.value = .endHeaderRefresh
                    })
                    .disposed(by:self.bag)
            }else{
                self.provider.rx.request(.GetHomeList).asObservable().asObservable()
                .filterSuccessfulStatusCodes()
                .mapJSON()
                .mapObject(type: HomeModel.self).subscribe(onNext: { (model) in
                    self.modelObserable.value += model.stories!
                    self.refreshStateObserable.value = self.pageIndex > 3 ? .noMoreData : .endFooterRefresh
                }, onError: { (error) in
                    self.refreshStateObserable.value = .endFooterRefresh
                })
                .disposed(by:self.bag)
                
            }
        }
        .disposed(by: bag)
        
        
        //刷新状态的监听
        refreshStateObserable.asObservable().subscribe(onNext: { (state) in
            switch state{
            case .beginHeaderRefresh:
                self.tableV.mj_header.beginRefreshing()
            case .endHeaderRefresh:
                self.tableV.mj_header.endRefreshing()
                self.tableV.mj_footer.resetNoMoreData()
            case .beginFooterRefresh:
                self.tableV.mj_footer.beginRefreshing()
            case .endFooterRefresh:
                self.tableV.mj_footer.endRefreshing()
            case .noMoreData:
                self.tableV.mj_footer.endRefreshingWithNoMoreData()
            default:
                break
            }
        })
        .disposed(by:bag)
        
    }
}

