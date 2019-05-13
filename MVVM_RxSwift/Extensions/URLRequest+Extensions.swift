//
//  URLRequest+Extensions.swift
//  MVVM_RxSwift
//
//  Created by Mendhy Syiasko on 11/05/19.
//  Copyright © 2019 Mendhy Syiasko. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


struct Resource<T: Decodable> {
    let url: URL
    
}


extension URLRequest {
    
    static func Load<T>(resource: Resource<T>) -> Observable<T> {
        
        return Observable.just(resource.url)
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
        }
        
    }
}
