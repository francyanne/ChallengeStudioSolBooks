//
//  HomeModel.swift
//  ChallengeStudioSol
//
//  Created by Fran Martins on 01/11/22.
//

import Foundation

// MARK: Books
struct Books: Decodable {
    let data: DataClass
}

// MARK: DataClass
struct DataClass: Decodable {
    let favoriteBooks: [FavoriteBook]
    let favoriteAuthors: [FavoriteAuthor]
    let allBooks: [AllBook]
}

// MARK: AllBook
struct AllBook: Decodable {
    let category: String
    let name: String
    let cover: String
    let author: String
}

// MARK: FavoriteAuthor
struct FavoriteAuthor: Decodable {
    let name: String
    let booksCount: Int
    let picture: String
}

// MARK: FavoriteBook
struct FavoriteBook: Decodable {
    let name: String
    let author: String
    let cover: String
}

