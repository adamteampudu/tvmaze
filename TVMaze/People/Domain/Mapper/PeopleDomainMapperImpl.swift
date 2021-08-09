//
//  ShowsDomainMapperImpl.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

struct PeopleDomainMapperImpl: PeopleDomainMapper {

    func mapToPresentation(_ value: [Person]) -> [UiPerson] {
        value.map {
            UiPerson(
                id: $0.id,
                url: $0.url,
                name: $0.name,
                country: UiCountry(
                    name: $0.country?.name,
                    code: $0.country?.code,
                    timezone: $0.country?.timezone
                ),
                birthday: $0.birthday,
                deathday: $0.deathday,
                gender: $0.gender,
                image: UiImage(
                    medium: $0.image?.medium,
                    original: $0.image?.original
                ),
                links: UiLinks(
                    linksSelf: UiLink(href: $0.links.linksSelf?.href) ,
                    previousepisode: UiLink(href: $0.links.previousepisode?.href),
                    nextepisode: UiLink(href: $0.links.nextepisode?.href)
                )
            )
        }
    }

    func mapToPresentation(_ value: Person) -> UiPerson {
        UiPerson(
            id: value.id,
            url: value.url,
            name: value.name,
            country: UiCountry(
                name: value.country?.name,
                code: value.country?.code,
                timezone: value.country?.timezone
            ),
            birthday: value.birthday,
            deathday: value.deathday,
            gender: value.gender,
            image: UiImage(
                medium: value.image?.medium,
                original: value.image?.original
            ),
            links: UiLinks(
                linksSelf: UiLink(href: value.links.linksSelf?.href) ,
                previousepisode: UiLink(href: value.links.previousepisode?.href),
                nextepisode: UiLink(href: value.links.nextepisode?.href)
            )
        )
    }

    func mapToPresentation(_ value: [Cast]) -> [UiCast] {
        value.map {
            UiCast(
                personCrewSelf: $0.personCrewSelf,
                voice: $0.voice,
                links: UiPersonCrewLinks(
                    show: UiCharacter(href: $0.links?.show.href ?? ""),
                    character: UiCharacter(href: $0.links?.character.href ?? "")
                ),
                embedded: UiEmbeddedShow(show: map($0.embedded?.show))
            )
        }
    }

    func mapToPresentation(_ value: [Crew]) -> [UiCrew] {
        value.map {
            UiCrew(
                type: $0.type,
                links: UiPersonCrewLinks(
                    show: UiCharacter(href: $0.links?.show.href ?? ""),
                    character: UiCharacter(href: $0.links?.character.href ?? "")
                ),
                embedded: UiEmbeddedShow(show: map($0.embedded?.show))
            )
        }
    }

    private func map(_ value: Show?) -> UiShow? {
        guard let value = value else { return nil }
        return UiShow(
            id: value.id,
            url: value.url,
            name: value.name,
            image: UiImage(
                medium: value.image?.medium ?? nil,
                original: value.image?.original
            ),
            type: value.type,
            language: value.language,
            genres: value.genres,
            status: value.status,
            runtime: value.runtime,
            averageRuntime: value.averageRuntime,
            premiered: value.premiered,
            officialSite: value.officialSite,
            schedule: UiSchedule(
                time: value.schedule?.time,
                days: value.schedule?.days
            ),
            rating: UiRating(average: value.rating?.average),
            weight: value.weight,
            network: UiNetwork(
                id: value.network?.id,
                name: value.network?.name,
                country: UiCountry(
                    name: value.network?.country?.name,
                    code: value.network?.country?.code,
                    timezone: value.network?.country?.timezone
                )
            ),
            webChannel: UiNetwork(
                id: value.webChannel?.id,
                name: value.webChannel?.name,
                country: UiCountry(
                    name: value.webChannel?.country?.name,
                    code: value.webChannel?.country?.code,
                    timezone: value.webChannel?.country?.timezone
                )
            ),
            externals: UiExternals(
                tvrage: value.externals?.tvrage,
                thetvdb: value.externals?.thetvdb,
                imdb: value.externals?.imdb
            ),
            summary: value.summary,
            updated: value.updated,
            links: UiLinks(
                linksSelf: UiLink(href: value.links?.linksSelf?.href),
                previousepisode: UiLink(href: value.links?.previousepisode?.href),
                nextepisode: UiLink(href: value.links?.nextepisode?.href)
            )
        )
    }

}
