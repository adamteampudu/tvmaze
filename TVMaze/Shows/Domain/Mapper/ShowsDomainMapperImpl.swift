//
//  ShowsDomainMapperImpl.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

struct ShowsDomainMapperImpl: ShowsDomainMapper {
    func mapToPresentation(_ value: [Show]) -> [UiShow] {
        value.map {
            UiShow(
                id: $0.id,
                url: $0.url,
                name: $0.name,
                image: UiImage(
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
                schedule: UiSchedule(
                    time: $0.schedule?.time,
                    days: $0.schedule?.days
                ),
                rating: UiRating(average: $0.rating?.average),
                weight: $0.weight,
                network: UiNetwork(
                    id: $0.network?.id,
                    name: $0.network?.name,
                    country: UiCountry(
                        name: $0.network?.country?.name,
                        code: $0.network?.country?.code,
                        timezone: $0.network?.country?.timezone
                    )
                ),
                webChannel: UiNetwork(
                    id: $0.webChannel?.id,
                    name: $0.webChannel?.name,
                    country: UiCountry(
                        name: $0.webChannel?.country?.name,
                        code: $0.webChannel?.country?.code,
                        timezone: $0.webChannel?.country?.timezone
                    )
                ),
                externals: UiExternals(
                    tvrage: $0.externals?.tvrage,
                    thetvdb: $0.externals?.thetvdb,
                    imdb: $0.externals?.imdb
                ),
                summary: $0.summary,
                updated: $0.updated,
                links: UiLinks(
                    linksSelf: UiNextEpisode(href: $0.links?.linksSelf?.href),
                    previousepisode: UiNextEpisode(href: $0.links?.previousepisode?.href),
                    nextepisode: UiNextEpisode(href: $0.links?.nextepisode?.href)
                )
            )
        }
    }

    func mapToPresentation(_ value: [Episode]) -> [UiEpisode] {
        value.map {
            UiEpisode(
                id: $0.id,
                url: $0.url,
                name: $0.name,
                season: $0.season,
                type: $0.type,
                airdate: $0.airdate,
                airtime: $0.airtime,
                airstamp: $0.airstamp,
                runtime: $0.runtime,
                image: UiImage(medium: $0.image?.medium, original: $0.image?.original),
                summary: $0.summary,
                links: UiLinks(
                    linksSelf: UiNextEpisode(href: $0.links?.linksSelf?.href) ,
                    previousepisode: UiNextEpisode(href: $0.links?.previousepisode?.href),
                    nextepisode: UiNextEpisode(href: $0.links?.nextepisode?.href)
                )
            )
        }
    }
}
