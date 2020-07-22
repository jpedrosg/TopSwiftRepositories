//
//  ListPullRequestModels.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante De Oliveira on 21/07/20.
//  Copyright (c) 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum ListPullRequest {
    
    struct  Response {
        let pullRequests: [PullRequest]
    }
    
    struct PullRequest: Codable {
        let title: String
        let body: String?
        let user: TopListRepositoriesModel.Owner
    }
    
    struct Request {
        let author: String
        let repository: String
        
        init(repository: TopListRepositoriesModel.Repository) {
            self.author = repository.owner.login
            self.repository = repository.name
        }
    }
    
    struct ViewModel {
        let title: String
        let body: String?
        let user: String
        let avatarUrl: String
        
        init(pullRequest: PullRequest) {
            self.title = pullRequest.title
            self.body = pullRequest.body
            self.user = pullRequest.user.login
            self.avatarUrl = pullRequest.user.avatarUrl
        }
    }
    
}
