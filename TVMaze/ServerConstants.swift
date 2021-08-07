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
    }

}
