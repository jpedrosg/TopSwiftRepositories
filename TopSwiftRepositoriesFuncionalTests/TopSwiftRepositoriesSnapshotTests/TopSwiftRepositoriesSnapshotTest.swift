//
//  TopSwiftRepositoriesSnapshotTest.swift
//  TopSwiftRepositoriesFuncionalTests
//
//  Created by João Pedro Giarrante on 06/10/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import FBSnapshotTestCase
@testable import TopSwiftRepositories

class ToSwiftRpositoriesSnapshotTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
//        recordMode = true
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    enum Identifiers {
        enum TopListRepositoriesID: String {
            case firstScreenLoading = "first_screen_loading"
            case firstScreen = "first_screen"
            case repositoryCell = "repository_cell"
            case infinityLoading = "infinity_loading"
        }
        enum ListPullRequest: String {
            case pullRequestsScreen = "pull_requests_screen"
            case pullRequestCell = "pull_request_cell"
        }
    }
    
    func testViewControllerFlow() {
        validateTopListRepositories {
            validateListPullRequest() {}
        }
        
    }
    
    
    func validateTopListRepositories(finished: () -> Void) {
        let imageViewLoadingScreen = getCurrentImageScreen()
        guard let tableView = tester().waitForView(withAccessibilityIdentifier: "tableView") as? UITableView else {
            XCTFail("TableView not found")
            return
        }
        
        // validate layout first loading screen
        FBSnapshotVerifyView(imageViewLoadingScreen, identifier: Identifiers.TopListRepositoriesID.firstScreenLoading.rawValue, overallTolerance: 0.2)
        
        
        //validate layout repository cell
        if let cell = tester().waitForCell(at: IndexPath(item: 0, section: 0), in: tableView) as? RepositoryCell {
            FBSnapshotVerifyView(cell, identifier: Identifiers.TopListRepositoriesID.repositoryCell.rawValue)
        }
        
        // validade first page
        tableView.contentOffset.y = 0
        tester().waitForAnimationsToFinish()
        let imageViewFirstScreen = getCurrentImageScreen()
        
        FBSnapshotVerifyView(imageViewFirstScreen, identifier: Identifiers.TopListRepositoriesID.firstScreen.rawValue, overallTolerance: 0.2)
        
        
        //validate infinity scroll layout
        tableView.scrollToRow(at: IndexPath(row: tableView.numberOfRows(inSection: 0)-1, section: 0), at: .bottom, animated: true)
        
        tester().waitForAnimationsToFinish()
        let imgFooter = getCurrentImageScreen()
        FBSnapshotVerifyView(imgFooter, identifier: Identifiers.TopListRepositoriesID.infinityLoading.rawValue,overallTolerance: 0.2)
        
        finished()
    }
    
    func validateListPullRequest(finished: () -> Void) {
        guard let tableView = tester().waitForView(withAccessibilityIdentifier: "tableView") as? UITableView else {
            XCTFail("TableView not found")
            return
        }
        
        if let _ = tester().waitForCell(at: IndexPath(item: 0, section: 0), in: tableView) as? RepositoryCell {
            tester().tapRow(at: IndexPath(item: 0, section: 0), in: tableView)
            tester().tapRow(at: IndexPath(item: 0, section: 0), in: tableView)
            
            guard let tableViewPullRequests = tester().waitForView(withAccessibilityIdentifier: "tableViewPullRequest") as? UITableView else {
                XCTFail("TableView not found")
                return
            }
            tableViewPullRequests.contentOffset.y = 0
            tester().waitForAnimationsToFinish()
            if let cell = tester().waitForCell(at: IndexPath(item: 0, section: 0), in: tableViewPullRequests) as? PullRequestCell {
                FBSnapshotVerifyView(getCurrentImageScreen(), identifier: Identifiers.ListPullRequest.pullRequestsScreen.rawValue, overallTolerance: 0.2)
                FBSnapshotVerifyView(cell, identifier: Identifiers.ListPullRequest.pullRequestCell.rawValue)
            }
        }
        
        finished()
    }
    
    func getCurrentImageScreen() -> UIImageView {
        let image = XCUIScreen.main.screenshot().image
        let imageView = UIImageView(image: image.removeStatusBar())
        return imageView
    }
}
