//
//  ServerConstants.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

enum ServerConstants {

    static let rateLimitError = 429

    static let baseUrl = "https://api.tvmaze.com/"

    enum Shows {
        private static let basePath = "shows"
        static let shows = "\(basePath)"
        static let showsPaginated = "\(basePath)?page=/%@"
        static let showSeasons = "\(basePath)/%@/episodes"
    }

    enum Search {
        private static let basePath = "search"
        static let shows = "\(basePath)"
        static let people = "\(basePath)/people?q=%@"
    }

    enum People {
        private static let basePath = "people"
        static let person = "\(basePath)/%@"
        static let cast = "\(basePath)/%@/castcredits?embed=show"
        static let crew = "\(basePath)/%@/crewcredits?embed=show"
    }

}
