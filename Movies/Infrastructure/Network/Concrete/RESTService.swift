//
//  RESTService.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
import Combine
// swiftlint:disable force_cast

final class RESTService: RestServiceProtocol {

   private let session = URLSession.shared

    func get<T: Decodable, S: EndPointProtocol>(endpoint: S) -> AnyPublisher<T, Error> {

        startRequest(method: APIMethod.get.rawValue, headers: endpoint.parameter, jsonBody: nil as String?, endpoint: endpoint)
            .tryMap({try $0.decodeData()})
            .eraseToAnyPublisher()

    }

    private func startRequest<E: Encodable, S: EndPointProtocol>(method: String, headers: [URLQueryItem]? = nil, jsonBody: E? = nil, endpoint: S) -> AnyPublisher<ResponseData, Error> {

        let request: URLRequest

        do {
            request = try buildRequest(method: method, headers: headers, jsonBody: jsonBody, endpoint: endpoint)
        } catch {

            return Fail(error: error)
                .eraseToAnyPublisher()

        }
        return session.dataTaskPublisher(for: request)
            .mapError({ error -> Error in
                return NetworkError.api(description: error.localizedDescription)
            })
            .tryMap { data, response in

               let response = response as! HTTPURLResponse
                if response.statusCode != 200 {

                    throw NetworkError.urlResponseCode(description: "Status code is: \(response.statusCode)")
                }

                return ResponseData(data: data, response: response)

            }
            .eraseToAnyPublisher()

    }

    private func buildRequest<E: Encodable, S: EndPointProtocol>(method: String, headers: [URLQueryItem]?, jsonBody: E?, endpoint: S)throws -> URLRequest {

        var request = URLRequest(url: endpoint.url)

        request.httpMethod = method

        if let jsonBody = jsonBody {
            do {
                request.httpBody = try JSONEncoder().encode(jsonBody)
            } catch let error {
                throw  NetworkError.encodingError(description: error.localizedDescription)
            }

        }

      return  request

    }

    struct ResponseData {
        let data: Data
        let response: HTTPURLResponse

        func decodeData<T: Decodable>() throws -> T {

            if data.isEmpty {

                throw

                NetworkError.decodingError(description: "Data is empty")   }
            let decoder = JSONDecoder()

            do {

                return try decoder.decode(T.self, from: data)
            } catch {

        throw NetworkError.decodingError(description: "Data could not decode because of : \(error.localizedDescription)")
            }

        }
    }
}
// swiftlint:enable force_cast
