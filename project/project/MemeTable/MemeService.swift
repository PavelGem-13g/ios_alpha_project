//
//  MemeService.swift
//  project
//
//  Created by Павел on 11.11.2023.
//

import Foundation

protocol MemeServicing: AnyObject {
    func fetchMeme(completionHandler: @escaping ([Meme]) -> Void)
}

final class MemeService {
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    let session: URLSession = {
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        return session
    }()
}

// MARK: - BeerServicing

extension MemeService: MemeServicing {
    func fetchMeme(completionHandler: @escaping ([Meme]) -> Void) {
        let url: URL = URL(string: "https://api.imgflip.com/get_memes")!
        session.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
            let memesData = try! self.decoder.decode(MemesData.self, from: data)
            completionHandler(memesData.data.memes)
        }).resume()
    }
}

