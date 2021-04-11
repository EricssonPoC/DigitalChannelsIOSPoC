//
//  NetworkManager.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 8.04.2021.
//

import Foundation
import YMNetwork_Swift

// MARK: - NetworkManager

class NetworkManager {

    static let environment: Global.NetworkEnvironment = .alpha
    static let shared = NetworkManager()

    private let manager = YMNetworkManager(
        configuration: YMNetworkConfiguration(
            baseURL: environment.baseURL,
            headers: [:]
        )
    )

    func request<T: YMResponse>(
        request: YMRequest,
        completion: @escaping (_ response: T?, _ error: String?) -> ()
    ) {

        manager.request(request) { (response, result: YMResult<T>, error) in

            if error != nil {
                completion(nil, "Please check your network connection")
            }

            switch result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.rawValue)
            }
        }
    }
}
