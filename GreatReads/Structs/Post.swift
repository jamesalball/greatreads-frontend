//
//  Post.swift
//  Gooder Reads
//
//  Created by James Ball on 8/12/25.
//

import SwiftUI

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let userName: String
    let postType: PostType
    let book: Book?
    let reviewRating: Double?
    let reviewText: String?
    let page: Int?
    let totalPages: Int?
    let comment: String?
}
