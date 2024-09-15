//
//  MovieDetailsViewModelTests.swift
//  MoviesChallengeTests
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import XCTest
import Combine
import Foundation

@testable import MoviesChallenge

class MovieDetailsViewModelTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {

        cancellables = []
        super.tearDown()
    }
    
    @MainActor
    func testToogleAddedToWatchList_whenWatchListItemIsEmpty_ShouldAddIt() {
        // Given:
        let movieID = 1
        let modelContext = ModelContainerBuilder.build(isStoredInMemoryOnly: true).mainContext
        let viewModel = MovieDetailsViewModel(movieID: movieID, modelContext: modelContext, watchListItem: nil)
        let assertion = XCTestExpectation(description: "Watch List Item should have been created.")

        // When:
        viewModel.toogleAddedToWatchList()
        
        
        // Then:
        viewModel.wacthListManager.list.sink { watchListItem in
            XCTAssertNotNil(watchListItem.first)
            XCTAssertEqual(watchListItem.first?.movieID, movieID)
            assertion.fulfill()
        }
        .store(in: &cancellables)

        wait(for: [assertion], timeout: 0.3)
    }
    
    
    @MainActor
    func testLoadDetails_WhenRequestMightFail() async {
        // Given:
        let movieID = 1
        let modelContext = ModelContainerBuilder.build(isStoredInMemoryOnly: true).mainContext
        let viewModelBothSucessful = MovieDetailsViewModel(movieID: movieID, modelContext: modelContext, movieService: MovieServiceMock(shouldFail: false), videosService: VideosServiceMock(shouldFail: false))
        let viewModelBothFail = MovieDetailsViewModel(movieID: movieID, modelContext: modelContext, movieService: MovieServiceMock(shouldFail: true), videosService: VideosServiceMock(shouldFail: true))
        let viewModelMovieFails = MovieDetailsViewModel(movieID: movieID, modelContext: modelContext, movieService: MovieServiceMock(shouldFail: true), videosService: VideosServiceMock(shouldFail: false))
        let viewModelVideoFails = MovieDetailsViewModel(movieID: movieID, modelContext: modelContext, movieService: MovieServiceMock(shouldFail: false), videosService: VideosServiceMock(shouldFail: true))

        // When:
        await viewModelBothSucessful.loadDetails()
        await viewModelBothFail.loadDetails()
        await viewModelMovieFails.loadDetails()
        await viewModelVideoFails.loadDetails()
        
        // Then:
        
        XCTAssertNotNil(viewModelBothSucessful.movie)
        XCTAssertNotNil(viewModelBothSucessful.youtubeVideoID)
        
        XCTAssertNil(viewModelBothFail.movie)
        XCTAssertNil(viewModelBothFail.youtubeVideoID)
        
        XCTAssertNil(viewModelMovieFails.movie)
        XCTAssertNil(viewModelMovieFails.youtubeVideoID)
        
        XCTAssertNotNil(viewModelVideoFails.movie)
        XCTAssertNil(viewModelVideoFails.youtubeVideoID)
    }
}
