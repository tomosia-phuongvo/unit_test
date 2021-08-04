//
//  NetworkService.swift
//  SwiftUITemplate
//
//  Created by apple on 27/05/2021.
//

import Foundation
import Network

struct NetworkService {
    static let shared = NetworkService()

    private let monitor = NWPathMonitor()

    func startMonitor() {
        monitor.pathUpdateHandler = { path in
            let newStatus = networkConnectStatusFromNWPath(path)
            DispatchQueue.main.async {
                StoreGroup.appStore.dispatch(action: AppAction.changeNetworkConnectStatus(newStatus))
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    private func networkConnectStatusFromNWPath(_ path: NWPath) -> NetworkConnectStatus {
        let status = path.status
        if status == .unsatisfied {
            return .notConnect
        }
        if path.isExpensive {
            return .connectWithCellularData
        } else {
            return .connectWithWifi
        }
    }
}
