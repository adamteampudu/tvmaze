//
//  ShowsDataMapperImpl.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

struct ShowsDataMapperImpl: ShowsDataMapper {

    func mapToDomain(_ value: [ApiShow]) -> [Show] {
        value.map {
            Show(
                id: $0.id,
                url: $0.url,
                name: $0.name,
                image: Image(
                    medium: $0.image?.medium ?? nil,
                    original: $0.image?.original
                ),
                type: $0.type,
                language: $0.language,
                genres: $0.genres,
                status: $0.status,
                runtime: $0.runtime,
                averageRuntime: $0.averageRuntime,
                premiered: $0.premiered,
                officialSite: $0.officialSite,
                schedule: Schedule(
                    time: $0.schedule?.time,
                    days: $0.schedule?.days
                ),
                rating: Rating(average: $0.rating?.average),
                weight: $0.weight,
                network: Network(
                    id: $0.network?.id,
                    name: $0.network?.name,
                    country: Country(
                        name: $0.network?.country?.name,
                        code: $0.network?.country?.code,
                        timezone: $0.network?.country?.timezone
                    )
                ),
                webChannel: Network(
                    id: $0.webChannel?.id,
                    name: $0.webChannel?.name,
                    country: Country(
                        name: $0.webChannel?.country?.name,
                        code: $0.webChannel?.country?.code,
                        timezone: $0.webChannel?.country?.timezone
                    )
                ),
                externals: Externals(
                    tvrage: $0.externals?.tvrage,
                    thetvdb: $0.externals?.thetvdb,
                    imdb: $0.externals?.imdb
                ),
                summary: $0.summary,
                updated: $0.updated,
                links: Links(
                    linksSelf: Link(href: $0.links?.linksSelf.href),
                    previousepisode: Link(href: $0.links?.previousepisode?.href),
                    nextepisode: Link(href: $0.links?.nextepisode?.href)
                )
            )
        }

    }

    func mapToDomain(_ value: [ApiEpisode]) -> [Episode] {
        value.map {
            Episode(
                id: $0.id,
                url: $0.url,
                name: $0.name,
                season: $0.season,
                type: $0.type,
                airdate: $0.airdate,
                airtime: $0.airtime,
                airstamp: $0.airstamp,
                runtime: $0.runtime,
                image: Image(medium: $0.image?.medium, original: $0.image?.original),
                summary: $0.summary,
                links: Links(
                    linksSelf: Link(href: $0.links?.linksSelf.href) ,
                    previousepisode: Link(href: $0.links?.previousepisode?.href),
                    nextepisode: Link(href: $0.links?.nextepisode?.href)
                )
            )
        }
    }

}
