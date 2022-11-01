//
//  HomeViewModel.swift
//  ChallengeStudioSol
//
//  Created by Fran Martins on 01/11/22.
//

import Foundation

class HomeViewModel {
    // MARK: Methods
    func getBooksInfo(completion: @escaping ((Books) -> Void)) {
        guard let fileURL = Bundle.main.url(forResource: "books.json", withExtension: nil) else {return}
        guard let jsonData = try? Data(contentsOf: fileURL) else { return }
        do {
            let booksInfo = try JSONDecoder().decode(Books.self, from: jsonData)
            print(booksInfo)
            completion(booksInfo)
        } catch {
            print(error.localizedDescription)
        }
         
    }
}
