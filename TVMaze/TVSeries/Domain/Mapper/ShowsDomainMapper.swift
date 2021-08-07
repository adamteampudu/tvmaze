//
//  ShowsDomainMapper.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

protocol ShowsDomainMapper {
    func mapToPresentation(_ value: [Show]) -> [UiShow]
}
