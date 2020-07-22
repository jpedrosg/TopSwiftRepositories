//
//  ListPullRequestWorker.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante De Oliveira on 21/07/20.
//  Copyright (c) 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
// This tag below is used to create the testable files from the Cuckoo pod
// CUCKOO_TESTABLE

import Foundation
import PromiseKit

class ListPullRequestWorker {
    
    let networkProvider = NetworkProvider.shared

    func getPullsRequests(request: ListPullRequest.Request) -> Promise<[ListPullRequest.PullRequest]>{
        let requestProvider: ListPullRequestProvider = ListPullRequestProvider(request: request)
        return networkProvider.request(requestProvider, parseAs: [ListPullRequest.PullRequest].self)
    }
}
