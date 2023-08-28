//
//  DetailPresenterTests.swift
//  MoviesTests
//
//  Created by Erdem on 26.08.2023.
//
import Combine
import Foundation
@testable import Movies
import XCTest
class DetailPresenterTests: XCTestCase, LogProvidable {

    private var mockService: RestServiceProtocol!
    private var interactor: MockDetailInteractor!
    private var presenter: MockPresenter!

    override func setUpWithError() throws {
        mockService = app.service
        interactor = MockDetailInteractor(restService: mockService)
        presenter = MockPresenter(interactor: interactor)
        presenter.interactor = interactor
    }

    func test_DetailPresenter_fetchDetail_isEqual() {
        let expectation = XCTestExpectation(description: "Fetch detail expectation")

        // Set up a subscriber to the publisher before calling fetchDetail
        let cancellable = presenter.$mockDetailData
            .sink { detail in
                // Assert or compare the received detail with your JSON data

                if let detail = detail {
                    do {
                        let jsonData = try StaticJSONMapper.decode(file: "MovieDetails", type: MovieDetail.self)
                        XCTAssertEqual(detail.backdropPath, jsonData.backdropPath)

                        expectation.fulfill()
                    } catch {
                        XCTFail("Error decoding JSON data: \(error)")
                    }
                }
            }

        presenter.fetchDetail()

        cancellable.store(in: &presenter.cancellables)

        wait(for: [expectation], timeout: 10)
    }

}

final class MockPresenter: DetailViewPresenterProtocol {
    var cancellables = Set<AnyCancellable>()

    @Published var mockDetailData: MovieDetail?
    let mockID = "292431"
    var interactor: DetailViewInteractorProtocol
    init(interactor: DetailViewInteractorProtocol) {
        self.interactor = interactor
    }
    func fetchDetail() {
        interactor.getDetailsWithID(self.mockID)
            .receive(on: DispatchQueue.main)
            .sink { compl in
                switch compl {
                case .finished:
                    break
                case .failure(let error):
                    Self.logger.error("Could not fetch data: \(error.localizedDescription)")

                }
            } receiveValue: { [weak self] mockResponse in
                guard let self = self else {return}

                self.mockDetailData = mockResponse
                dump(mockDetailData)

            }
            .store(in: &cancellables)
    }

    func openURL() {

    }

    func saveToCore() {

    }

    func viewDidload() {

    }

}

final class MockDetailInteractor: DetailViewInteractorProtocol {
    let service: RestServiceProtocol
    init(restService: RestServiceProtocol) {
        self.service = restService
    }
    func getDetailsWithID(_ id: String) -> AnyPublisher<MovieDetail, Error> {
        service.get(endpoint: MovieDetailEndPoint.detail(id))
    }

    func handleCreateDelete(type: CoreCRUD) {

    }

    func fetchDataFromCore(id: Int, comp: @escaping (Result<[MoviesMain], Error>) -> Void) {

    }

}
