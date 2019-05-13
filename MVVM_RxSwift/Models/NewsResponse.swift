//
//  NewsResponse.swift
//  MVVM_RxSwift
//
//  Created by Mendhy Syiasko on 11/05/19.
//  Copyright © 2019 Mendhy Syiasko. All rights reserved.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
