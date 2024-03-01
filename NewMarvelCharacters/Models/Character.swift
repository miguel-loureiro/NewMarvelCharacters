//
//  Character.swift
//  NewMarvelCharacters
//
//  Created by António Loureiro on 29/02/2024.
//

import Foundation

typealias Stories = List
typealias Comics = List
typealias Events = List
typealias Series = List

struct Thumbnail: Codable {
    let path: String
    let `extension`: String

    var imageURL: URL {
        URL(string: "\(path).\(`extension`)")!
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(path, forKey: .path)
        try container.encode(`extension`, forKey: .extension)
    }
}

struct Character: Codable, Equatable {
    let name: String?
    let description: String?
    let thumbnail: Thumbnail?
    var stories: Stories?
    var comics: Comics?
    var events: Events?
    var series: Series?

    private enum CodingKeys : String, CodingKey {
        case name, description, thumbnail, stories, comics,
             events, series
    }

    static func ==(lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name && lhs.description == rhs.description
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(thumbnail, forKey: .thumbnail)
        try container.encode(stories, forKey: .stories)
        try container.encode(comics, forKey: .comics)
        try container.encode(events, forKey: .events)
        try container.encode(series, forKey: .series)
    }
}

