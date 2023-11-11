//
//  MemeDTO.swift
//  project
//
//  Created by Павел on 11.11.2023.
//

import Foundation


struct MemesData: Codable {
    let success: Bool
    let data: Memes
}

struct Memes: Codable {
    let memes: [Meme]
}

struct Meme: Codable {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let boxCount: Int  // Используйте boxCount вместо "box_count"
    let captions: Int
}
