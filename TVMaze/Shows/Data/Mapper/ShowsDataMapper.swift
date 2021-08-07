//
//  ShowsDataMapper.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

protocol ShowsDataMapper {
    func mapToDomain(_ value: [ApiShow]) -> [Show]
    func mapToDomain(_ value: [ApiEpisode]) -> [Episode]
}
