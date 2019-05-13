//
//  Article.swift
//  MVVM_RxSwift
//
//  Created by Mendhy Syiasko on 11/05/19.
//  Copyright © 2019 Mendhy Syiasko. All rights reserved.
//

import Foundation

struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String?
    
}

struct Source: Decodable {
    let id: String?
    let name: String
}
