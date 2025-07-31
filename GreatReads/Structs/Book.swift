//
//  Book.swift
//  Gooder Reads
//
//  Created by James Ball on 8/12/25.
//

import SwiftUI

struct Book: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let author: String
    let description: String
    let avgRating: Double
}
