//
//  DatabaseHelper.swift
//  Daksh-ilaBank
//
//  Created by Neosoft on 04/07/23.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

struct JSONHelper {
    func loadJsonDataFromFile() -> (HomeModel?) {
        guard let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        if let mainData = decodeData(data: data) {
            return mainData
        }
        return nil
    }
    
    private func decodeData( data: Data) -> HomeModel? {
        guard let jsonData = try? JSONDecoder().decode(HomeModel.self, from: data) else { return nil }
        return jsonData
    }
}
