//
//  NewsTableViewController.swift
//  MVVM_RxSwift
//
//  Created by Mendhy Syiasko on 11/05/19.
//  Copyright © 2019 Mendhy Syiasko. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    var disposeBag = DisposeBag()
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setLargeTitle()
        
        populateNews()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.articlesVM.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleTableViewCell", for: indexPath) as? ArticleTableViewCell else {fatalError("cell is not found")}
            
        let articleVM = self.articleListVM.articleAt(indexPath.row)
        articleVM.title.asDriver(onErrorJustReturn: "error")
        .drive(cell.title.rx.text)
        .disposed(by: disposeBag)
        
        articleVM.description.asDriver(onErrorJustReturn: "error")
            .drive(cell.articleDescription.rx.text)
            .disposed(by: disposeBag)
        
        return cell
    }
    
    func setLargeTitle(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func populateNews(){
        let resource = Resource<NewsResponse>(url: URL(string: URLContants.newsPath.urlNews.rawValue)!)
        
        URLRequest.Load(resource: resource)
            .subscribe(onNext: { articleResponse in
                let articles = articleResponse.articles
                self.articleListVM = ArticleListViewModel.init(articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }, onCompleted: {
                print("complete")
            }, onDisposed: {
                print("dispose")
            }).disposed(by: disposeBag)
    }
}
