//
//  ArticleViewModel.swift
//  MVVM_RxSwift
//
//  Created by Mendhy Syiasko on 11/05/19.
//  Copyright © 2019 Mendhy Syiasko. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
}

extension ArticleListViewModel {
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
    
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.articlesVM[index]
    }
}

struct ArticleViewModel {
    
    let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description)
    }
    
}